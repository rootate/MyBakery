import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';


class DatabaseService {
  final DateFormat formatter = DateFormat('yyyy-MM-dd'); 
  var uuid = Uuid();
  final employeesReference =
      FirebaseDatabase.instance.reference().child('bakery').child('employees');

  final producedBreadReference =
      FirebaseDatabase.instance.reference().child('bakery').child('dailyData');

  void addEmployee(Map data) {
    var v1 = uuid.v1();
    employeesReference.child(v1).set(data);
  }

  void addEkmek(Map data) {
    var day = DateTime.now();
  }

  void updateEmployee(String uid, Map data) {
    employeesReference.child(uid).update(data);
  }

  void deleteEmployee(String uid) {
    employeesReference.child(uid).remove();
  }
}
