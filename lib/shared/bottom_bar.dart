import "package:flutter/material.dart";

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