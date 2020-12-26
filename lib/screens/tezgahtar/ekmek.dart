import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_my_bakery/models/models.dart';
import 'package:flutter_my_bakery/services/database.dart';
import 'package:flutter_my_bakery/shared/cards.dart';

class Ekmek extends StatefulWidget {
  Function(Brightness brightness) changeTheme;
  Ekmek({Key key, this.title, Function(Brightness brightness) changeTheme})
      : super(key: key) {
    this.changeTheme = changeTheme;
  }

  final String title;
  @override
  _EkmekState createState() => new _EkmekState();
}

class _EkmekState extends State<Ekmek> {
  bool isFlagOn = false;
  bool headerShouldHide = false;
  final TextEditingController _textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<EkmekModel> ekmekList = [];

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
    setState(() {
      ekmekList = fetchedEkmek;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Ekmek Gir', style: TextStyle(fontFamily: "Poppins"),),
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
                buildHeaderWidget(context),
                // buildButtonRow(),
                // buildImportantIndicatorText(),
                // Container(height: 32),
                ...buildEkmekComponentsList(), // burası düzeltilecek
                // child: AddExpenseCardComponent()),
              ],
            ),
            margin: EdgeInsets.only(top: 2),
            padding: EdgeInsets.only(left: 15, right: 15),
          ),
        ),
        floatingActionButton: new RaisedButton(
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
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      NotesDatabaseService.db.addEkmekInDB(
                                          EkmekModel(
                                              amount: _textFieldController.text,
                                              time: DateTime.now()
                                                  .toIso8601String()));
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
          child: Text("Ekmek Ekle"),
        ));
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
            'Ekmek Gir',
            style: TextStyle(
                fontFamily: 'ZillaSlab',
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
            return new AlertDialog(
                // title: new Text(' "${ekmek}" kaydı silinecek?'),
                actions: <Widget>[
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
      print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
    });
  }

  List<Widget> buildEkmekComponentsList() {
    print(
        "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
    List<Widget> ekmekComponentsList = [];
    ekmekList.sort((a, b) {
      return b.time.compareTo(a.time);
    });
    ekmekList.forEach((note) {
      ekmekComponentsList.add(EkmekCardComponent(
        ekmekData: note,
        onTapAction: (_) =>_showDialog(note),
      ));
    });
    return ekmekComponentsList;
  }
}
