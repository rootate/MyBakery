import 'package:flutter/material.dart';

class Employees extends StatelessWidget {
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
        )
    );
  }
}
