import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_my_bakery/shared/constants.dart';

List products = ['Ürün 1', 'Ürün 2', 'Ürün 3', 'Ürün 4',
  'Ürün 5', 'Ürün 6', 'Ürün 7', 'Ürün 8'];

List prices = [10, 5, 2, 3,
  6, 4, 1, 8];

int sumPrice = 0;
int indirim = 0;

class OdemeKategori extends StatefulWidget {
  String category;

  OdemeKategori ({ Key key, this.category }): super(key: key);

  @override
  _OdemeKategoriState createState() => _OdemeKategoriState();
}

class _OdemeKategoriState extends State<OdemeKategori> {
  @override
  Widget build(BuildContext context) {
    final contextW = MediaQuery.of(context).size.width;
    final contextH = MediaQuery.of(context).size.height;

    final sizeW = contextW / 20;
    final sizeH = contextH / 20;

    final image = Image(image: AssetImage('assets/images/icons/bread2.png'));

    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.toString(),style: TextStyle(fontFamily: "Poppins"),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              confirmationPopup(context,image,index,controller);
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
            title: Text(products[index],style: TextStyle(fontFamily: "Poppins"),),
            trailing: Text(prices[index].toString() + " ₺",style: TextStyle(fontFamily: "Poppins",fontSize: 20),),
          );
        },

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          controller2.text = sumPrice.toString();
          controller3.text = indirim.toString();
          confirmationPopup2(context,image,controller2,controller3);
        },
        icon: Icon(Icons.shopping_cart_outlined),
        label: Text(sumPrice.toString() + " ₺",style: TextStyle(fontFamily: "Poppins",fontSize: 20),),
      ),
    );
  }

  confirmationPopup(BuildContext dialogContext,Widget image,int index,TextEditingController controller) {
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
        title: "Adet gir",
        content: Column(
          children: [
            SizedBox(height: sizeW,),
            image,
            SizedBox(height: sizeW,),
            TextFormField(
              controller: controller,
              style: textStyle1,
              decoration: textInputDecoration.copyWith(
                labelText: "Adeti giriniz",
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
              "Ekle",
              style: TextStyle(color: Colors.white, fontSize: sizeW),
            ),
            onPressed: () {
              setState(() {
                int x = prices[index] * int.parse(controller.value.text);
                sumPrice += x;
              });
              Navigator.pop(context);
            },
            color: Colors.blue,
          )
        ]).show();
  }

  confirmationPopup2(BuildContext dialogContext,Widget image,TextEditingController controller2,TextEditingController controller3) {
    double finalPrice = (int.parse(controller2.value.text) - indirim/100*int.parse(controller2.value.text) );
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
        title: "Sepet",
        content: Column(
          children: [
            SizedBox(height: 20,),
            Text("Fiyat : " + controller2.value.text + " ₺"),
            SizedBox(height: 30,),
            Text("İndirim oranı : " + indirim.toString() + " %"),
            SizedBox(height: 30,),
            Text("Son fiyat : " + finalPrice.toString() + " ₺"),
          ],
        ),
        buttons: [
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
              "Ürünleri gör",
              style: TextStyle(color: Colors.white, fontSize: sizeW),
            ),
            onPressed: () {
              setState(() {

              });
              Navigator.pop(context);
            },
            color: Colors.blue,
          )
        ]).show();
  }

}


