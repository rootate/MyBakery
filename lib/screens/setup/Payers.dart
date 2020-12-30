import 'package:flutter/material.dart';
import '../../models/Payer.dart';
import '../../widgets/NewPayer.dart';

class Payers extends StatefulWidget {
  final List<Payer> list;
  Payers({this.list});
  @override
  _PayersState createState() => _PayersState(payerList: list);
}

class _PayersState extends State<Payers> {
  List<Payer> payerList = [];
  void _addNewPayer(String prName, double prAmount) {
    final newPayer = Payer(name: prName, debt: prAmount);
    setState(() {
      payerList.add(newPayer);
    });
  }

  _PayersState({this.payerList});

  void _startAddNewpayer(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewPayer(_addNewPayer),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void deletePayer(String name) {
    setState(() {
      payerList.removeWhere((pr) => pr.name == name);
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => _startAddNewpayer(context))
        ],
        backgroundColor: Colors.green,
        title: Text("Veresiyeler"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              child: ListView.builder(
                itemCount: payerList.length,
                padding: EdgeInsets.only(top: 10),
                itemBuilder: (ctx, index) {
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
                              payerList[index].name,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          Container(
                            child: Text(
                              payerList[index].debt.toStringAsFixed(2) + " ₺",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () =>
                                  deletePayer(payerList[index].name))
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
        backgroundColor: Colors.green,
        child: Icon(Icons.done),
        onPressed: () => nextPage(context),
      ),
    );
  }
}
