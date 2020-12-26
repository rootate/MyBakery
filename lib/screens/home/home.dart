import 'dart:developer';
import 'package:flutter_my_bakery/screens/service/service_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/screens/products.dart';
import 'package:flutter_my_bakery/screens/employees.dart';
import 'package:flutter_my_bakery/screens/reports.dart';
import 'package:flutter_my_bakery/shared/bottom_bar.dart';
import 'package:flutter_my_bakery/screens/tezgahtar/tezgahtar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  bool loading = false;

  int seciliSayfa = 0;
  void sayfaDegistir(int index) {
    setState(() {
      seciliSayfa = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width / 6 - 5;
    double size1 = MediaQuery.of(context).size.height / 80;

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Administrator",
                style: TextStyle(fontFamily: "Poppins"),
    return LayoutBuilder(builder: (context,constraints){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/background2.jpg"),fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    SizedBox(height: size1),
                    myBox2(context),
                    SizedBox(height: size1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myBox(context,Icon(Icons.local_shipping,size: iconSize,),"Şoför",Products()),
                        SizedBox(width: size1),
                        myBox(context,Icon(Icons.bubble_chart,size: iconSize,),"Tezgahtar",Products()),
                        SizedBox(width: size1),
                        myBox(context,Icon(Icons.fastfood,size: iconSize,),"Ürünler",Products()),
                      ],
                    ),
                    SizedBox(height: size1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myBox(context,Icon(Icons.file_copy,size: iconSize,),"Raporlar",Reports()),
                        SizedBox(width: size1),
                        myBox(context,Icon(Icons.people,size: iconSize,),"Çalışanlar",Employees()),
                        SizedBox(width: size1),
                        myBox(context,Icon(Icons.all_out,size: iconSize,),"Veresiyeler",Products()),
                      ],
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.blueGrey[100],
                  ),
                  label: Text(
                    "Exit",
                    style: TextStyle(
                        color: Colors.blueGrey[100], fontFamily: "Poppins"),
                  ),
                  onPressed: () async {
                    setState(() => loading = true);
                    dynamic result = await _auth.signOut();
                    if (result == null) {
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                )
              ],
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/background2.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: size1),
                          myBox2(context),
                          SizedBox(height: size1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myBox(
                                  context,
                                  Icon(
                                    Icons.local_shipping,
                                    size: iconSize,
                                  ),
                                  "Şoför",
                                  Service()),
                              SizedBox(width: size1),
                              myBox(
                                  context,
                                  Icon(
                                    Icons.bubble_chart,
                                    size: iconSize,
                                  ),
                                  "Tezgahtar",
                                  Tezgahtar()),
                              SizedBox(width: size1),
                              myBox(
                                  context,
                                  Icon(
                                    Icons.fastfood,
                                    size: iconSize,
                                  ),
                                  "Ürünler",
                                  Products()),
                            ],
                          ),
                          SizedBox(height: size1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myBox(
                                  context,
                                  Icon(
                                    Icons.file_copy,
                                    size: iconSize,
                                  ),
                                  "Raporlar",
                                  Reports()),
                              SizedBox(width: size1),
                              myBox(
                                  context,
                                  Icon(
                                    Icons.people,
                                    size: iconSize,
                                  ),
                                  "Çalışanlar",
                                  Employees()),
                              SizedBox(width: size1),
                              myBox(
                                  context,
                                  Icon(
                                    Icons.all_out,
                                    size: iconSize,
                                  ),
                                  "Veresiyeler",
                                  Products()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            bottomNavigationBar:
                myBottomNavigationBar(seciliSayfa, sayfaDegistir),
          );
        },
    );
  }
}

Widget myBox(BuildContext context, Icon icon, String string, Widget function) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => function),
      );
    },
    child: Container(
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      width: MediaQuery.of(context).size.width / 3 - 10,
      height: MediaQuery.of(context).size.width / 3 - 10,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              string,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  fontSize: 17),
            )
          ],
        ),
      ),
    ),
  );
}

Widget myBox2(BuildContext context) {
  double size1 = MediaQuery.of(context).size.height / 30;

  return Container(
    alignment: Alignment.topRight,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30.0))),
    width: MediaQuery.of(context).size.width - 10,
    height: MediaQuery.of(context).size.width / 4 - 10,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cached_sharp,
            color: Colors.black,
            size: size1,
          ),
          Text("Deneme")
        ],
      ),
    ),
  );
}
