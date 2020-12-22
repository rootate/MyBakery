import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_my_bakery/shared/faderoute.dart';
import 'package:flutter_my_bakery/models/models.dart';
import 'package:flutter_my_bakery/screens/edit.dart';
import 'package:flutter_my_bakery/screens/view.dart';
import 'package:flutter_my_bakery/services/database.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter_my_bakery/shared/cards.dart';

class Expense extends StatefulWidget {
  Function(Brightness brightness) changeTheme;
  Expense({Key key, this.title, Function(Brightness brightness) changeTheme})
      : super(key: key) {
    this.changeTheme = changeTheme;
  }

  final String title;

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  bool isFlagOn = false;
  bool headerShouldHide = false;
  List<ExpensesModel> expensesList = [];
  TextEditingController searchController = TextEditingController();

  bool isSearchEmpty = true;

  @override
  void initState() {
    super.initState();
    NotesDatabaseService.db.init();
    setExpensesFromDB();
  }

  setExpensesFromDB() async {
    print("Entered setExpenses");
    var fetchedExpenses = await NotesDatabaseService.db.getExpensesFromDB();
    setState(() {
      expensesList = fetchedExpenses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gider Gir",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          gotoEditExpense();
        },
        label: Text('Gider Ekle'.toUpperCase()),
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
              buildHeaderWidget(context),
              // buildButtonRow(),
              // buildImportantIndicatorText(),
              // Container(height: 32),
              ...buildExpenseComponentsList(),
              GestureDetector(
                  onTap: gotoEditExpense, child: AddExpenseCardComponent()),
              Container(height: 100)
            ],
          ),
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.only(left: 15, right: 15),
        ),
      ),
    );
  }

  // Widget buildButtonRow() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 10, right: 10),
  //     child: Row(
  // children: <Widget>[
  //   GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         isFlagOn = !isFlagOn;
  //       });
  //     },
  // child: AnimatedContainer(
  //   duration: Duration(milliseconds: 160),
  //   height: 50,
  //   width: 50,
  //   curve: Curves.slowMiddle,
  //   child: Icon(
  //     isFlagOn ? Icons.flag : OMIcons.flag,
  //     color: isFlagOn ? Colors.white : Colors.grey.shade300,
  //   ),
  // decoration: BoxDecoration(
  //     color: isFlagOn ? Colors.blue : Colors.transparent,
  //     border: Border.all(
  //       width: isFlagOn ? 2 : 1,
  //       color:
  //           isFlagOn ? Colors.blue.shade700 : Colors.grey.shade300,
  //     ),
  //     borderRadius: BorderRadius.all(Radius.circular(16))),
  //   ),
  // ),
  // Expanded(
  //   child: Container(
  //     alignment: Alignment.center,
  //     margin: EdgeInsets.only(left: 8),
  //     padding: EdgeInsets.only(left: 16),
  //     height: 50,
  //     decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey.shade300),
  //         borderRadius: BorderRadius.all(Radius.circular(16))),
  //     // child: Row(
  //     //   mainAxisSize: MainAxisSize.max,
  //     //   crossAxisAlignment: CrossAxisAlignment.center,
  //     //   children: <Widget>[
  //     //     // Expanded(
  //     //     //   child: TextField(
  //     //     //     controller: searchController,
  //     //     //     maxLines: 1,
  //     //     //     onChanged: (value) {
  //     //     //       handleSearch(value);
  //     //     //     },
  //     //     //     autofocus: false,
  //     //     //     keyboardType: TextInputType.text,
  //     //     //     style:
  //     //     //         TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
  //     //     //     textInputAction: TextInputAction.search,
  //     //     //     decoration: InputDecoration.collapsed(
  //     //     //       hintText: 'Ara',
  //     //     //       hintStyle: TextStyle(
  //     //     //           color: Colors.grey.shade300,
  //     //     //           fontSize: 18,
  //     //     //           fontWeight: FontWeight.w500),
  //     //     //       border: InputBorder.none,
  //     //     //     ),
  //     //     //   ),
  //     //     // ),
  //     //   ],
  //     ),
  //   ),
  // )
  //       ],
  //     ),
  //   );
  // }

  Widget buildHeaderWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          margin: EdgeInsets.only(top: 8, bottom: 32, left: 10),
          width: headerShouldHide ? 0 : 200,
          child: Text(
            'Giderler',
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

  List<Widget> buildExpenseComponentsList() {
    List<Widget> expenseComponentsList = [];
    expensesList.sort((a, b) {
      return b.date.compareTo(a.date);
    });
    if (searchController.text.isNotEmpty) {
      expensesList.forEach((note) {
        if (note.title
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            note.content
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
          expenseComponentsList.add(ExpenseCardComponent(
            expenseData: note,
            onTapAction: openExpenseToRead,
          ));
      });
      return expenseComponentsList;
    }
    // else {
    expensesList.forEach((note) {
      expenseComponentsList.add(ExpenseCardComponent(
        expenseData: note,
        onTapAction: openExpenseToRead,
      ));
    });
    // }
    return expenseComponentsList;
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

  void gotoEditExpense() {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                EditExpensePage(triggerRefetch: refetchExpensesFromDB)));
  }

  void refetchExpensesFromDB() async {
    await setExpensesFromDB();
    print("Refetched notes");
  }

  openExpenseToRead(ExpensesModel expenseData) async {
    setState(() {
      headerShouldHide = true;
    });
    await Future.delayed(Duration(milliseconds: 230), () {});
    Navigator.push(
        context,
        FadeRoute(
            page: ViewExpensePage(
                triggerRefetch: refetchExpensesFromDB,
                currentExpense: expenseData)));
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
