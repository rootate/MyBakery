import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import 'info_card.dart';

class Service extends StatefulWidget {
  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("dd.MM.yyyy");

    String currentTime = dateFormat.format(DateTime.now());

    DateTime minTime = DateTime(2018, 12, 5);

    DateTime maxTime = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[10],
      appBar: AppBar(
        title: Text(
          "Ana Menü",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: RaisedButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currentTime,
                          style: TextStyle(
                              fontFamily: "Poppins", color: Colors.white),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    color: Colors.indigo,
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: minTime,
                          maxTime: maxTime, onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.tr);
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    //ilk satır
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              height: MediaQuery.of(context).size.height / 6,
                              child: InfoCard(
                                label: "ÜRÜN",
                                info: "2500",
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              height: MediaQuery.of(context).size.height / 6,
                              child: InfoCard(
                                label: "ÖDEME",
                                info: "500",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              height: MediaQuery.of(context).size.height / 6,
                              child: InfoCard(
                                label: "BAYAT",
                                info: "2500",
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              height: MediaQuery.of(context).size.height / 6,
                              alignment: Alignment.center,
                              child: InfoCard(
                                label: "BORÇ",
                                info: "500",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white,
                            padding: EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "MARKETLER",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.shopping_basket,
                                  size: MediaQuery.of(context).size.height / 15,
                                  color: Colors.blueGrey,
                                )
                              ],
                            ),
                            onPressed: () => print("clicked marketler"),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white,
                            padding: EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "RAPOR",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.assignment,
                                  size: MediaQuery.of(context).size.height / 15,
                                  color: Colors.blueGrey,
                                )
                              ],
                            ),
                            onPressed: () => print("clicked rapor"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
