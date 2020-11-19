import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/models/user.dart';
import 'package:flutter_my_bakery/screens/wrapper.dart';
import 'package:flutter_my_bakery/services/auth.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
