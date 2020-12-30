import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference harun = FirebaseFirestore.instance.collection('harun');
  CollectionReference harun_employees = FirebaseFirestore.instance.collection('harun').doc("VC8qu0uo2yOiaNsoOR5q").collection('employees').doc("iPQuXllnINUyswJfP7SZ").collection('user');

  bool isLoggedIn(){
    if (FirebaseAuth.instance.currentUser != null){
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(Map data) async{
    if(isLoggedIn()){
      users.add(data).catchError((e){
        print(e);
      });
    } else {
      print("You need to login");
    }
  }

  Future getCollections() async{
    users.get().then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((doc) {
        print(doc["full_name"]);
      })
    });
  }

  Future<void> addHarunEmployee(Map data) async{
    if(isLoggedIn()){
      harun_employees.add(data).catchError((e){
        print(e);
      });
    } else {
      print("You need to login");
    }
  }

  Future<void> updateHarunEmployee(String uid,Map data) async{
    if(isLoggedIn()){
      harun_employees.doc(uid).update(data).catchError((e){
        print(e);
      });
    } else {
      print("You need to login");
    }
  }

  Future<void> deleteHarunEmployee(String uid) async{
    if(isLoggedIn()){
      harun_employees.doc(uid).delete().catchError((e){
        print(e);
      });
    } else {
      print("You need to login");
    }
  }
}