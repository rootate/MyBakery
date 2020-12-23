import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'info_card.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ana Menü",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[700],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: HorizontalCalendar(
                  date: DateTime.now(),
                  textColor: Colors.black45,
                  backgroundColor: Colors.blueGrey[50],
                  selectedColor: Colors.deepPurple[700],
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
                              color: Colors.blueGrey[50],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            height: MediaQuery.of(context).size.height / 6,
                            child: InfoCard(
                              label: "ÖDEME",
                              info: "500",
                              color: Colors.blueGrey[50],
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
                              color: Colors.blueGrey[50],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            height: MediaQuery.of(context).size.height / 6,
                            alignment: Alignment.center,
                            child: InfoCard(
                              label: "BORÇ",
                              info: "500",
                              color: Colors.blueGrey[50],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.blueGrey[50],
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
                            Icon(Icons.shopping_basket)
                          ],
                        ),
                        onPressed: () => print("clicked marketler"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.blueGrey[50],
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
                            Icon(Icons.assignment)
                          ],
                        ),
                        onPressed: () => print("clicked rapor"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
