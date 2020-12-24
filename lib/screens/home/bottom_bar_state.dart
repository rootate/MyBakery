import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/screens/home/home.dart';
import 'package:flutter_my_bakery/screens/home/my_businesses.dart';
import 'package:flutter_my_bakery/shared/bottom_bar.dart';
import 'package:flutter_my_bakery/shared/loading.dart';
import 'package:flutter_my_bakery/services/auth.dart';


class BottomBarState extends StatefulWidget {
  @override
  _BottomBarStateState createState() => _BottomBarStateState();
}

class _BottomBarStateState extends State<BottomBarState> {
  final AuthService _auth = AuthService();
  bool loading = false;

  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    MyBusinesses(),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text("Administrator",style: TextStyle(fontFamily: "Poppins"),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.exit_to_app,color: Colors.blueGrey[100],),
            label: Text("Exit",style: TextStyle(color: Colors.blueGrey[100],fontFamily: "Poppins"),),
            onPressed: () async{
              setState(() => loading = true);
              dynamic result = await _auth.signOut();
              if(result == null){
                setState(() {
                  loading = false;
                });
              }
            },
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: myBottomNavigationBar(_currentIndex, onTappedBar),
    );
  }
}
