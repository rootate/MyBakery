import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/screens/tezgahtar/sepet.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_my_bakery/shared/constants.dart';

List products = ['Ürün 1', 'Ürün 2', 'Ürün 3', 'Ürün 4',
  'Ürün 5', 'Ürün 6', 'Ürün 7', 'Ürün 8'];
List prices = [10, 5, 2, 3, 6, 4, 1, 8];

class ProductsIn extends StatefulWidget {
  String category;

  ProductsIn ({ Key key, this.category }): super(key: key);

  @override
  _ProductsInState createState() => _ProductsInState();
}

class _ProductsInState extends State<ProductsIn> {
  @override
  Widget build(BuildContext context) {
    final contextW = MediaQuery.of(context).size.width;
    final contextH = MediaQuery.of(context).size.height;

    final sizeW = contextW / 20;
    final sizeH = contextH / 20;

    final image = Image(image: AssetImage('assets/images/icons/bread2.png'));

    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();

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
              controller.text = products[index];
              controller2.text = prices[index].toString();
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
            title: Text(products[index],style: TextStyle(fontFamily: "Poppins"),),
            trailing: Text(prices[index].toString() + " ₺",style: TextStyle(fontFamily: "Poppins",fontSize: 20),),
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

  confirmationPopup(BuildContext dialogContext,Widget image,int val,int index,TextEditingController controller,TextEditingController controller2) {
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
        title: val == 0 ? "Ürün ekle" : "Ürünü düzenle",
        content: Column(
          children: [
            SizedBox(height: sizeW,),
            TextFormField(
              controller: controller,
              style: textStyle1,
              decoration: textInputDecoration.copyWith(
                labelText: "Ürünün ismi",
              ),
              validator: (val) => val.isEmpty ? "Enter an email" : null,
              onChanged: (val) {
                setState(() {

                });
              },
            ),
            SizedBox(height: sizeW,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controller2,
              style: textStyle1,
              decoration: textInputDecoration.copyWith(
                labelText: "Ürünün fiyatı",
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
                products.remove(controller.value.text);
                prices.remove(index);
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
                setState(() {
                  if(val == 0) {
                    products.add(controller.value.text);
                    prices.add(controller2.value.text);
                  } else {
                    products[index] = controller.value.text;
                    prices[index] = controller2.value.text;
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


