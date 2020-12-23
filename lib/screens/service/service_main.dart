import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'info_card.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Container(
                width: double.infinity,
                child: HorizontalCalendar(
                    date: DateTime.now(),
                    textColor: Colors.black45,
                    backgroundColor: Colors.blueGrey[50],
                    selectedColor: Colors.blueGrey,
                    onDateSelected: (date) => print(
                          date.toString(),
                        )),
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
