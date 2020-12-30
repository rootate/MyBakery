import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/shared/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_my_bakery/services/crud.dart';

List employees = ['Harun Albayrak', 'Ümit Altıntaş', 'Yusuf Akgül', 'Bilal Bayrakdar',
  'Ömer Faruk Sayar'];

List subtitles = ['Şoför', 'Tezgahtar', 'None', 'None', 'None'];

String uid;

class Employees extends StatefulWidget {
  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  DatabaseService service = DatabaseService();

  @override
  void initState() {
    //DocumentSnapshot documentSnapshot = service.getHarunEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contextW = MediaQuery.of(context).size.width;
    final contextH = MediaQuery.of(context).size.height;

    final sizeW = contextW / 20;
    final sizeH = contextH / 20;

    final image = Image(image: AssetImage('assets/images/icons/user.png'));

    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    return StreamBuilder<QuerySnapshot>(
      stream: service.harun_employees.snapshots(),
      builder: (context,snapshot){
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return  Container(
              height: 200.0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),
              ),
            );
          default: return Scaffold(
            appBar: AppBar(
              title: Text("Employees",style: TextStyle(fontFamily: "Poppins"),),
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
            ),
            body: ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                List<DocumentSnapshot> employeeList = snapshot.data.docs;
                return ListTile(
                  onLongPress: (){
                    controller.text = employeeList[index].data()['name'];
                    controller2.text = employeeList[index].data()['job'];
                    uid = employeeList[index].id;
                    confirmationPopup(context,image,1,index,controller,controller2);
                  },
                  onTap: () {
                    controller.text = employeeList[index].data()['name'];
                    controller2.text = employeeList[index].data()['job'];
                    uid = employeeList[index].id;
                    confirmationPopup(context,image,1,index,controller,controller2);
                  },
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: sizeW,
                      minHeight: sizeH,
                      maxWidth: sizeW + 20,
                      maxHeight: sizeH + 20,
                    ),
                    child: image,
                  ),
                  title: Text(employeeList[index].data()['name'],style: TextStyle(fontFamily: "Poppins"),),
                  trailing: Text(employeeList[index].data()['job'],style: TextStyle(fontFamily: "Poppins"),),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                confirmationPopup(context,image,0,0,controller,controller2);
              },
              child: Icon(Icons.add),
            ),
          );
        }
      },
    );
  }

  confirmationPopup(BuildContext dialogContext,Widget image,int val,int index,TextEditingController controller,TextEditingController controller2) {
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
              setState(() {
                service.deleteHarunEmployee(uid);
              });
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
              if(controller.value.text != "" && controller2.value.text != ""){
                final params = {
                  'name' : controller.value.text,
                  'job' : controller2.value.text
                };
                setState(() {
                  if(val == 0) {
                    service.addHarunEmployee(params);
                  } else {
                    service.updateHarunEmployee(uid, params);
                  }
                });
              }
              Navigator.pop(context);
            },
            color: Colors.blue,
          )
        ]).show();
  }
}

