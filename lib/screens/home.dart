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
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/background2.jpg"),fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                myBox2(context),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myBox(context,Icon(Icons.local_shipping,size: 65,),"Şoför"),
                    SizedBox(width: 10),
                    myBox(context,Icon(Icons.bubble_chart,size: 65,),"Tezgahtar"),
                    SizedBox(width: 10),
                    myBox(context,Icon(Icons.fastfood,size: 65,),"Ürünler"),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myBox(context,Icon(Icons.file_copy,size: 65,),"Raporlar"),
                    SizedBox(width: 10),
                    myBox(context,Icon(Icons.people,size: 65,),"Çalışanlar"),
                    SizedBox(width: 10),
                    myBox(context,Icon(Icons.all_out,size: 65,),"Veresiyeler"),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: myBottomNavigationBar(seciliSayfa, sayfaDegistir),
    );
  }
}

Widget myBox(BuildContext context, Icon icon, String string){
  return Container(
    alignment: Alignment.topRight,
    decoration: BoxDecoration(color: Color(0xFFF5F5F5),borderRadius: BorderRadius.all(Radius.circular(15.0))),
    width: MediaQuery.of(context).size.width / 3 - 10,
    height: MediaQuery.of(context).size.width / 3 - 10,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(string,style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w700,fontSize: 17),)
        ],
      ),
    ),
  );
}

Widget myBox2(BuildContext context){
  return Container(
    alignment: Alignment.topRight,
    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30.0))),
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