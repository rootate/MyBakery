import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/screens/authenticate/register.dart';
import 'package:flutter_my_bakery/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() {
      return showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn();
    } else {
      return Register();
    }
  }
}
