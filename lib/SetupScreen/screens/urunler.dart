import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/SetupScreen/models/Product.dart';
import 'package:flutter_my_bakery/SetupScreen/widgets/NewProduct.dart';

class Urunler extends StatefulWidget {
  final String category;
  final List<Product> list;
  Urunler({this.category, this.list});
  @override
  _UrunlerState createState() => _UrunlerState(categoryName: category, productList: list);
}

class _UrunlerState extends State<Urunler> {
  final String categoryName;
  List<Product> productList = [];
  void _addNewProduct(String prName, double prAmount) {
    final newProduct = Product(name: prName, amount: prAmount);
    setState(() {
      productList.add(newProduct);
    });
  }

  _UrunlerState({this.categoryName, this.productList});

  void _startAddNewProduct(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewProduct(_addNewProduct),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 7, left: 10, right: 10),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: Text(
                              productList[index].name,
                              style: TextStyle(fontSize: 24),
                            ),
                            margin: EdgeInsets.all(10),
                          ),
                          Container(
                            child: Text(
                              productList[index].amount.toStringAsFixed(2) +
                                  " ₺",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewProduct(context),
      ),
    );
  }
}
