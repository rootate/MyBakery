import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_my_bakery/shared/faderoute.dart';
import 'package:flutter_my_bakery/models/models.dart';
import 'package:flutter_my_bakery/screens/tezgahtar/edit.dart';
import 'package:flutter_my_bakery/screens/tezgahtar/view.dart';
import 'package:flutter_my_bakery/services/database.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter_my_bakery/shared/cards.dart';

class Veresiye extends StatefulWidget {
  Function(Brightness brightness) changeTheme;
  Veresiye({Key key, this.title, Function(Brightness brightness) changeTheme})
      : super(key: key) {
    this.changeTheme = changeTheme;
  }

  final String title;

  @override
  _VeresiyeState createState() => _VeresiyeState();
}

class _VeresiyeState extends State<Veresiye> {
  bool isFlagOn = false;
  bool headerShouldHide = false;
  List<VeresiyeModel> veresiyeList = [];
  TextEditingController searchController = TextEditingController();

  bool isSearchEmpty = true;

  @override
  void initState() {
    super.initState();
    NotesDatabaseService.db.init();
    setVeresiyeFromDB();
  }

  setVeresiyeFromDB() async {
    print("Entered setVeresiye");
    var fetchedVeresiye = await NotesDatabaseService.db.getVeresiyeFromDB();
    setState(() {
      veresiyeList = fetchedVeresiye;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Veresiyeler",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          gotoEditVeresiye();
        },
        label: Text('Veresiye Ekle'.toUpperCase()),
        icon: Icon(Icons.add),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     GestureDetector(
              //       behavior: HitTestBehavior.opaque,
              //       onTap: () {
              //         Navigator.push(
              //             context,
              //             CupertinoPageRoute(
              //                 builder: (context) => SettingsPage(
              //                     changeTheme: widget.changeTheme)));
              //       },
              //       child: AnimatedContainer(
              //         duration: Duration(milliseconds: 200),
              //         padding: EdgeInsets.all(16),
              //         alignment: Alignment.centerRight,
              //         child: Icon(
              //           OMIcons.settings,
              //           color: Theme.of(context).brightness == Brightness.light
              //               ? Colors.grey.shade600
              //               : Colors.grey.shade300,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // buildHeaderWidget(context),
              buildButtonRow(),
              // buildImportantIndicatorText(),
              Container(height: 32),
              ...buildveresiyeComponentsList(),
              GestureDetector(
                  onTap: gotoEditVeresiye, child: AddVeresiyeCardComponent()),
              Container(height: 100)
            ],
          ),
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.only(left: 15, right: 15),
        ),
      ),
    );
  }

  Widget buildButtonRow() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 8),
                    padding: EdgeInsets.only(left: 16),
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            maxLines: 1,
                            onChanged: (value) {
                              handleSearch(value);
                            },
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Ara',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                              isSearchEmpty ? Icons.search : Icons.cancel,
                              color: Colors.grey.shade300),
                          onPressed: cancelSearch,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
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
            'Notlar',
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

  Widget testListItem(Color color) {
    return new NoteCardComponent(
      noteData: NotesModel.random(),
    );
  }

  // Widget buildImportantIndicatorText() {
  //   return AnimatedCrossFade(
  //     duration: Duration(milliseconds: 200),
  //     firstChild: Padding(
  //       padding: const EdgeInsets.only(top: 8),
  //       child: Text(
  //         '\t\t\t\t\tYalnızca işaretlenmiş notlar listeleniyor.',
  //         style: TextStyle(
  //             fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
  //       ),
  //     ),
  //     secondChild: Container(
  //       height: 2,
  //     ),
  //     crossFadeState:
  //         isFlagOn ? CrossFadeState.showFirst : CrossFadeState.showSecond,
  //   );
  // }

  List<Widget> buildveresiyeComponentsList() {
    List<Widget> veresiyeComponentsList = [];
    veresiyeList.sort((a, b) {
      return b.date.compareTo(a.date);
    });
    if (searchController.text.isNotEmpty) {
      veresiyeList.forEach((note) {
        if (note.title
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            note.content
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
          veresiyeComponentsList.add(VeresiyeCardComponent(
            veresiyeData: note,
            onTapAction: openVeresiyeToRead,
          ));
      });
      return veresiyeComponentsList;
    } else {
      veresiyeList.forEach((note) {
        veresiyeComponentsList.add(VeresiyeCardComponent(
          veresiyeData: note,
          onTapAction: openVeresiyeToRead,
        ));
      });
    }
    return veresiyeComponentsList;
  }

  void handleSearch(String value) {
    if (value.isNotEmpty) {
      setState(() {
        isSearchEmpty = false;
      });
    } else {
      setState(() {
        isSearchEmpty = true;
      });
    }
  }

  void gotoEditVeresiye() {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                EditVeresiyePage(triggerRefetch: refetchVeresiyeFromDB)));
  }

  void refetchVeresiyeFromDB() async {
    await setVeresiyeFromDB();
    print("Refetched veresiye");
  }

  openVeresiyeToRead(VeresiyeModel veresiyeData) async {
    setState(() {
      headerShouldHide = true;
    });
    await Future.delayed(Duration(milliseconds: 230), () {});
    Navigator.push(
        context,
        FadeRoute(
            page: ViewVeresiyePage(
                triggerRefetch: refetchVeresiyeFromDB,
                currentVeresiye: veresiyeData)));
    await Future.delayed(Duration(milliseconds: 300), () {});

    setState(() {
      headerShouldHide = false;
    });
  }

  void cancelSearch() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      searchController.clear();
      isSearchEmpty = true;
    });
  }
}
