import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/shared/bottom_bar.dart';

class Employees extends StatefulWidget {
  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  int seciliSayfa = 0;
  void sayfaDegistir(int index){
    setState(() {
      seciliSayfa = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final employees = ['Harun Albayrak', 'Ümit Altıntaş', 'Yusuf Akgül', 'Bilal Bayrakdar',
      'Ömer Faruk Sayar'];

    final subtitles = ['Şoför', 'Tezgahtar', 'None', 'None', 'None'];

    final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit];

    return Scaffold(
        appBar: AppBar(
          title: Text("Employees",style: TextStyle(fontFamily: "Poppins"),),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView.builder(
          itemCount: employees.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {

              },
              leading: Icon(icons[index]),
              title: Text(employees[index],style: TextStyle(fontFamily: "Poppins"),),
              trailing: Text(subtitles[index],style: TextStyle(fontFamily: "Poppins"),),
            );
          },
        ),
        bottomNavigationBar: myBottomNavigationBar(seciliSayfa, sayfaDegistir),
    );
  }
}

