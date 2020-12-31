import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/models/Product.dart';
import 'package:flutter_my_bakery/widgets/NewProduct.dart';

class Urunler extends StatefulWidget {
  final String category;
  final List<Product> list;
  Urunler({this.category, this.list});
  @override
  _UrunlerState createState() =>
      _UrunlerState(categoryName: category, productList: list);
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

  void deleteProduct(String name) {
    setState(() {
      productList.removeWhere((pr) => pr.name == name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text(categoryName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              child: ListView.builder(
                itemCount: productList.length,
                padding: EdgeInsets.only(top: 10),
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 7),
                            child: Text(
                              productList[index].name,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          Container(
                            child: Text(
                              productList[index].amount.toStringAsFixed(2) +
                                  " ₺",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () =>
                                  deleteProduct(productList[index].name))
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
        backgroundColor: Colors.orange[700],
        child: Icon(Icons.add),
        onPressed: () => _startAddNewProduct(context),
      ),
    );
  }
}
