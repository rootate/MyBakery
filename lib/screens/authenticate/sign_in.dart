import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/services/auth.dart';
import 'package:flutter_my_bakery/shared/constants.dart';
import 'package:flutter_my_bakery/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      //backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        title: Text("Sign In",style: TextStyle(fontFamily: "Poppins"),),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF9BDEF5), Color(0xFF363F49)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Container(
            height: 440,
            width: 360,
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Icon(Icons.all_out,size: 80,),
                  SizedBox(height: 50.0),
                  TextFormField(
                    style: textStyle1,
                    decoration: textInputDecoration.copyWith(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.person,color: Colors.black,)
                    ),
                    validator: (val) => val.isEmpty ? "Enter an email" : null,
                    onChanged: (val) {
                      setState(() {
                        return email = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    style: textStyle1,
                    decoration: textInputDecoration.copyWith(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.vpn_key,color: Colors.black,),
                    ),
                    validator: (val) => val.length < 6 ? "Enter a password 6+ chars long" : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        return password = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: Colors.black12,
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async{
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email,password);
                        if(result == null){
                          setState(() {
                            loading = false;
                            return error = "Could not sign in with those credentials";
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(error,style: TextStyle(color: Colors.red,fontSize: 14.0),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
