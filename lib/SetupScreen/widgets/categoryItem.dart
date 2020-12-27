import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String image;

  CategoryItem(this.name, this.image);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 14),
            child: Image.asset(
              image,
              height: MediaQuery.of(context).size.height * 0.1,
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
    );
  }
}
