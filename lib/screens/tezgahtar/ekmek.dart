import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_my_bakery/models/models.dart';
import 'package:flutter_my_bakery/services/database.dart';
import 'package:flutter_my_bakery/shared/cards.dart';
import 'package:flutter_my_bakery/services/crud.dart';
import 'package:intl/intl.dart';

class Ekmek extends StatefulWidget {
  Ekmek({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _EkmekState createState() => new _EkmekState();
}

class _EkmekState extends State<Ekmek> {
  bool isFlagOn = false;
  bool headerShouldHide = false;
  final TextEditingController _textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  List<EkmekModel> ekmekList = [];

  DatabaseService service = DatabaseService();
  bool isSearchEmpty = true;

  @override
  void initState() {
    super.initState();
    NotesDatabaseService.db.init();
    setEkmekFromDB();
  }

  setEkmekFromDB() async {
    print("Entered setEkmek");
    var fetchedEkmek = await NotesDatabaseService.db.getEkmekFromDB();
    // var fetchedEkmek = await service.dailyDataReference
    //     .child(formatter.format(DateTime.now()))
    //     .child("producedBreads")
    //     .onValue;
    setState(() {
      ekmekList = fetchedEkmek;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Ekmek Gir',
          style: TextStyle(fontFamily: "Poppins"),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(height: 32),
              ...buildEkmekComponentsList(), // burası düzeltilecek
            ],
          ),
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.only(left: 15, right: 15),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        label: Text('Ekmek Ekle'.toUpperCase()),
        icon: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _textFieldController,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                child: Text("Kaydet"),
                                onPressed: () {
                                  if (!(_textFieldController.text.isEmpty ||
                                      int.parse(_textFieldController.text) <=
                                          0)) if (_formKey.currentState
                                      .validate()) {
                                    _formKey.currentState.save();
                                    NotesDatabaseService
                                        .db
                                        .addEkmekInDB(
                                          EkmekModel(
                                            amount: int.parse(
                                                    _textFieldController.text)
                                                .toString(),
                                            time: DateTime.now()
                                                .toIso8601String()));
                                    var res = EkmekModel(
                                            amount: int.parse(
                                                    _textFieldController.text)
                                                .toString(),
                                            time: DateTime.now()
                                                .toIso8601String());
                                    var temp = res.toMap();
                                    service.addEkmek(temp);

                                    
                                    _textFieldController.clear();
                                    setEkmekFromDB();
                                    Navigator.pop(
                                        context); // Close the add todo screen
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }

  Widget buildHeaderWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          margin: EdgeInsets.only(top: 8, bottom: 32, left: 10),
          width: headerShouldHide ? 0 : 200,
          child: Text(
            'Ekmekler2',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 36,
                color: Theme.of(context).primaryColor),
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
        ),
      ],
    );
  }

  _showDialog(EkmekModel ekmek) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(actions: <Widget>[
              new FlatButton(
                  child: new Text('Vazgeç'),
                  onPressed: () => Navigator.of(context).pop()),
              new FlatButton(
                  child: new Text('Sil'),
                  onPressed: () {
                    NotesDatabaseService.db.deleteEkmekInDB(ekmek);
                    Navigator.of(context).pop();
                    setEkmekFromDB();
                  })
            ]);
          });
    });
  }

  List<Widget> buildEkmekComponentsList() {
    List<Widget> ekmekComponentsList = [];
    ekmekList.sort((a, b) {
      return b.time.compareTo(a.time);
    });
    ekmekList.forEach((note) {
      ekmekComponentsList.add(EkmekCardComponent(
        ekmekData: note,
        onTapAction: (_) => _showDialog(note),
      ));
    });
    return ekmekComponentsList;
  }
}
