import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_my_bakery/shared/constants.dart';
import 'package:flutter_my_bakery/screens/administrator/products_in.dart';

List categories = ['Ekmekler', 'Kahvaltılıklar', 'Pastalar', 'İçecekler',
  'Tatlılar', 'Kurabiyeler', 'Hazır Gıdalar', 'Diğer'];

List images = ['ekmekler.jpeg','kahvaltiliklar.jpeg','pastalar.jpeg','icecekler.jpeg',
  'tatlilar.jpeg','kurabiyeler.jpeg','hazirGidalar.jpeg','diger.jpeg'];

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    final contextW = MediaQuery.of(context).size.width;
    final contextH = MediaQuery.of(context).size.height;

    final sizeW = contextW / 20;
    final sizeH = contextH / 20;

    var image = Image(image: AssetImage('assets/images/icons/'));

    TextEditingController controller = TextEditingController();

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
              onLongPress: (){
                controller.text = categories[index];
                image = Image(image: AssetImage('assets/images/' + images[index]));
                confirmationPopup(context,image,1,index,controller);
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductsIn(category: categories[index])),
                );
              },
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: sizeW,
                  minHeight: sizeH,
                  maxWidth: sizeW + 20,
                  maxHeight: sizeH + 20,
                ),
                child: Image(image: AssetImage('assets/images/' + images[index])),
              ),
              title: Text(categories[index],style: TextStyle(fontFamily: "Poppins"),),
            );
          },

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            confirmationPopup(context,image,0,0,controller);
          },
          child: Icon(Icons.add),
        ),
    );
  }

  confirmationPopup(BuildContext dialogContext,Widget image,int val,int index,TextEditingController controller) {
    final contextW = MediaQuery.of(context).size.width;
    final sizeW = contextW / 20;

    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      overlayColor: Colors.black87,
      isOverlayTapDismiss: true,
      titleStyle: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold, fontSize: sizeW),
      animationDuration: Duration(milliseconds: 400),
    );

    Alert(
        context: dialogContext,
        style: alertStyle,
        title: val == 0 ? "Kategori ekle" : "Kategoriyi düzenle",
        content: Column(
          children: [
            SizedBox(height: sizeW,),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 50,
                minHeight: 100,
                maxWidth: 100,
                maxHeight: 150,
              ),
              child: Image(image: AssetImage('assets/images/' + images[index]))
            ),
            SizedBox(height: sizeW,),
            TextFormField(
              controller: controller,
              style: textStyle1,
              decoration: textInputDecoration.copyWith(
                labelText: "Kategorinin ismi",
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
                categories.remove(controller.value.text);
                images.remove(index);
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
              if(controller.value.text != ""){
                setState(() {
                  if(val == 0) {
                    categories.add(controller.value.text);
                  } else {
                    categories[index] = controller.value.text;
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

