import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/SetupScreen/models/Worker.dart';
import '../widgets/NewWorker.dart';

class Workers extends StatefulWidget {
  final List<Worker> list;
  Workers({this.list});
  @override
  _WorkersState createState() => _WorkersState(workerList: list);
}

class _WorkersState extends State<Workers> {
  List<Worker> workerList = [];
  void _addNewWorker(String workerName, jobs gorevi) {
    final newWorker = Worker(name: workerName, job: gorevi);
    setState(() {
      workerList.add(newWorker);
    });
  }

  _WorkersState({this.workerList});

  void _startAddNewWorker(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewWorker(_addNewWorker),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void deleteWorker(String name) {
    setState(() {
      workerList.removeWhere((wr) => wr.name == name);
    });
  }

  void nextPage(BuildContext cx) {
    Navigator.of(cx).push(
      MaterialPageRoute(
        builder: (_) {
          return Scaffold();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String jobName;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => _startAddNewWorker(context))
        ],
        title: Text("Çalışanlar"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.90,
              child: ListView.builder(
                itemCount: workerList.length,
                padding: EdgeInsets.only(top: 10),
                itemBuilder: (ctx, index) {
                  if (workerList[index].job == jobs.tezgahtar) {
                    jobName = "Tezgahtar";
                  } else if (workerList[index].job == jobs.sofor) {
                    jobName = "Şoför";
                  } else
                    jobName = "Yönetici";
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 7),
                            child: Text(
                              workerList[index].name,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          Container(
                            child: Text(
                              jobName,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () =>
                                  deleteWorker(workerList[index].name))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () => nextPage(context),
      ),
    );
  }
}
