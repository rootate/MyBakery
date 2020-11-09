import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int seciliSayfa = 0;
  void sayfaDegistir(int index){
    setState(() {
      seciliSayfa = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Administrator",style: TextStyle(fontFamily: "Poppins"),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            myBox2(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myBox(),
                SizedBox(width: 10),
                myBox(),
                SizedBox(width: 10),
                myBox(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: myBottomNavigationBar(seciliSayfa, sayfaDegistir),
    );
  }
}

Widget myBox(){
  return Container(
    alignment: Alignment.topRight,
    decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.all(Radius.circular(15.0))),
    width: 120,
    height: 120,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cached_sharp,
            color: Colors.black,
            size: 50,
          ),
          Text("Deneme",style: TextStyle(fontFamily: "Poppins"),)
        ],
      ),
    ),
  );
}

Widget myBox2(){
  return Container(
    alignment: Alignment.topRight,
    decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.all(Radius.circular(30.0))),
    width: 380,
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

Widget myBottomNavigationBar(int index,void Function(int) function){
  return BottomNavigationBar(
    currentIndex: index,
    onTap: function,
    type: BottomNavigationBarType.fixed,
    iconSize: 35,
    fixedColor: Colors.blue,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.store_mall_directory_sharp),
        title: Text("İşletme Adı",style: TextStyle(fontFamily: "Poppins"),),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_balance),
        title: Text("İşletmelerim",style: TextStyle(fontFamily: "Poppins"),),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_box),
        title: Text("Yeni İşletme Ekle",style: TextStyle(fontFamily: "Poppins"),),
      ),
    ],
  );
}