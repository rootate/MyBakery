import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/shared/bottom_bar.dart';
import 'package:flutter_my_bakery/shared/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
    final contextW = MediaQuery.of(context).size.width;
    final contextH = MediaQuery.of(context).size.height;

    final sizeW = contextW / 20;
    final sizeH = contextH / 20;

    final image = Image(image: AssetImage('assets/images/icons/bread.png'));

    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();

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
                controller.text = employees[index];
                controller2.text = subtitles[index];
                confirmationPopup(context,image,1,controller,controller2);
              },
              leading: Icon(icons[index]),
              title: Text(employees[index],style: TextStyle(fontFamily: "Poppins"),),
              trailing: Text(subtitles[index],style: TextStyle(fontFamily: "Poppins"),),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            confirmationPopup(context,image,0,controller,controller2);
          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: myBottomNavigationBar(seciliSayfa, sayfaDegistir),
    );
  }

  confirmationPopup(BuildContext dialogContext,Widget image,int val,TextEditingController controller,TextEditingController controller2) {
    final contextW = MediaQuery.of(context).size.width;
    final sizeW = contextW / 20;

    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      overlayColor: Colors.black87,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      titleStyle: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold, fontSize: sizeW),
      animationDuration: Duration(milliseconds: 400),
    );

    Alert(
        context: dialogContext,
        style: alertStyle,
        title: val == 0 ? "Çalışan ekle" : "Çalışanı düzenle",
        content: Column(
          children: [
            SizedBox(height: sizeW,),
            image,
            SizedBox(height: sizeW,),
            TextFormField(
              controller: controller,
              style: textStyle1,
              decoration: textInputDecoration.copyWith(
                labelText: "İsim soyisim",
              ),
              validator: (val) => val.isEmpty ? "Enter an email" : null,
              onChanged: (val) {
                setState(() {

                });
              },
            ),
            SizedBox(height: sizeW,),
            TextFormField(
              controller: controller2,
              style: textStyle1,
              decoration: textInputDecoration.copyWith(
                labelText: "Görevi",
              ),
              validator: (val) => val.isEmpty ? "Enter an email" : null,
              onChanged: (val) {
                setState(() {

                });
              },
            ),
          ],
        ),
        buttons: [
          val == 1 ? DialogButton(
            child: Text(
              "Sil",
              style: TextStyle(color: Colors.white, fontSize: sizeW),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.red,
          ) :
          DialogButton(
            child: Text(
              "İptal",
              style: TextStyle(color: Colors.white, fontSize: sizeW),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.red,
          ),
          DialogButton(
            child: Text(
              val == 0 ? "Ekle" : "Düzenle",
              style: TextStyle(color: Colors.white, fontSize: sizeW),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue,
          )
        ]).show();
  }
}

