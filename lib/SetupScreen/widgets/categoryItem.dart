import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/SetupScreen/screens/urunler.dart';
import '../models/Product.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String image;
  final List<Product> liste = [];

  CategoryItem(this.name, this.image);

  void goProduct(BuildContext cx) {
    Navigator.of(cx).push(
      MaterialPageRoute(
        builder: (_) {
          return Urunler(
            category: name,
            list: liste,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goProduct(context),
      child: Card(
        elevation: 7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 14),
              child: Image.asset(
                image,
                height: MediaQuery.of(context).size.height * 0.11,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
