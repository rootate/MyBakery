import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var uuid = Uuid();
  final employeesReference =
      FirebaseDatabase.instance.reference().child('bakery').child('employees');

  final dailyDataReference =
      FirebaseDatabase.instance.reference().child('bakery').child('dailyData');

  void addEmployee(Map data) {
    var v1 = uuid.v1();
    employeesReference.child(v1).set(data);
  }

  void addEkmek(String uid, Map data) {
    var day = formatter.format(DateTime.now());

    dailyDataReference.child(day).child("producedBreads").child(uid).set(data);
  }

  void addExpense(String uid, Map data) {
    var day = formatter.format(DateTime.now());
    dailyDataReference.child(day).child("expenses").child(uid).set(data);
  }

  void updateEmployee(String uid, Map data) {
    employeesReference.child(uid).update(data);
  }

  void deleteEmployee(String uid) {
    employeesReference.child(uid).remove();
  }

  void deleteEkmek(String uid) {
    var day = formatter.format(DateTime.now());

    dailyDataReference.child(day).child("producedBreads").child(uid).remove();
  }
}
