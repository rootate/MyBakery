import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/shared/bottom_bar.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int seciliSayfa = 0;
  void sayfaDegistir(int index){
    setState(() {
      seciliSayfa = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['Ekmekler', 'Kahvaltılıklar', 'Pastalar', 'İçecekler',
      'Tatlılar', 'Kurabiyeler', 'Hazır Gıdalar', 'Diğer'];

    final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit];

    return Scaffold(
        appBar: AppBar(
          title: Text("Products",style: TextStyle(fontFamily: "Poppins"),),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {

              },
              leading: Icon(icons[index]),
              title: Text(categories[index],style: TextStyle(fontFamily: "Poppins"),),
            );
          },
        ),
        bottomNavigationBar: myBottomNavigationBar(seciliSayfa, sayfaDegistir),
    );
  }
}