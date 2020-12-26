import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/SetupScreen/screens/firstPage.dart';

main(List<String> args) {
  runApp(SetupScreen());
}

class SetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}
