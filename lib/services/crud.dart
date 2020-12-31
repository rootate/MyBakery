import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class DatabaseService{
  var uuid = Uuid();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference harun = FirebaseFirestore.instance.collection('harun');
  CollectionReference harun_employees = FirebaseFirestore.instance.collection('harun').doc("VC8qu0uo2yOiaNsoOR5q").collection('employees').doc("iPQuXllnINUyswJfP7SZ").collection('user');
  final employeesReference = FirebaseDatabase.instance.reference().child('bakery').child('employees');

  void addEmployee(Map data){
    var v1 = uuid.v1();
    employeesReference.child(v1).set(data);
  }

  void updateEmployee(String uid,Map data){
    employeesReference.child(uid).update(data);
  }

  void deleteEmployee(String uid){
    employeesReference.child(uid).remove();
  }
}