import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/shared/loading.dart';
import 'package:flutter_my_bakery/services/auth.dart';
import 'package:flutter_my_bakery/screens/products.dart';
import 'package:flutter_my_bakery/screens/employees.dart';
import 'package:flutter_my_bakery/screens/note.dart';
import 'package:flutter_my_bakery/screens/expenses.dart';

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
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Tezgahtar",
                style: TextStyle(fontFamily: "Poppins"),
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
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background2.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myBox(
                            context,
                            Icon(
                              Icons.local_shipping,
                              size: 65,
                            ),
                            "Gider Gir",
                            Expense()),
                        SizedBox(width: 10),
                        myBox(
                            context,
                            Icon(
                              Icons.bubble_chart,
                              size: 65,
                            ),
                            "Veresiye",
                            Products()),
                        SizedBox(width: 10),
                        myBox(
                            context,
                            Icon(
                              Icons.fastfood,
                              size: 65,
                            ),
                            "Ürün sat",
                            Products()),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 5),
                        myBox(
                            context,
                            Icon(
                              Icons.file_copy,
                              size: 65,
                            ),
                            "Not Al",
                            Note()),
                        SizedBox(width: 10),
                        myBox(
                            context,
                            Icon(
                              Icons.people,
                              size: 65,
                            ),
                            "Ekmek Gir",
                            Employees()),
                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
  return Container(
    alignment: Alignment.topRight,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30.0))),
    width: MediaQuery.of(context).size.width - 10,
    height: 85,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cached_sharp,
            color: Colors.black,
            size: 30,
          ),
          Text("Deneme")
        ],
      ),
    ),
  );
}
