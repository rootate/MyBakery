import 'dart:math';
import 'package:uuid/uuid.dart';
class NotesModel {
  int id;
  String title;
  String content;
  bool isImportant;
  DateTime date;

  NotesModel({this.id, this.title, this.content, this.isImportant, this.date});

  NotesModel.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.title = map['title'];
    this.content = map['content'];
    this.date = DateTime.parse(map['date']);
    this.isImportant = map['isImportant'] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': this.id,
      'title': this.title,
      'content': this.content,
      'isImportant': this.isImportant == true ? 1 : 0,
      'date': this.date.toIso8601String()
    };
  }

  NotesModel.random() {
    this.id = Random(10).nextInt(1000) + 1;
    this.title = 'Lorem Ipsum ' * (Random().nextInt(4) + 1);
    this.content = 'Lorem Ipsum ' * (Random().nextInt(4) + 1);
    this.isImportant = Random().nextBool();
    this.date = DateTime.now().add(Duration(hours: Random().nextInt(100)));
  }
}

class ExpensesModel {
  int id;
  String title;
  String content;
  DateTime date;

  ExpensesModel({this.id, this.title, this.content, this.date});

  ExpensesModel.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.title = map['title'];
    this.content = map['content'];
    this.date = DateTime.parse(map['date']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': this.id,
      'title': this.title,
      'content': this.content,
      'date': this.date.toIso8601String()
    };
  }
}

class EkmekModel {
  String id = Uuid().v1();
  String amount;
  String time;

  EkmekModel({this.amount, this.time});

  EkmekModel.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.amount = map['amount'];
    this.time = map['time'];
  }

  Map<String, String> toMap() {
    return <String, String>{
      '_id': this.id.toString(),
      'title': this.amount,
      'content': this.time,
    };
  }
}

class VeresiyeModel {
  int id;
  String title;
  String content;
  DateTime date;

  VeresiyeModel({this.id, this.title, this.content, this.date});

  VeresiyeModel.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.title = map['title'];
    this.content = map['content'];
    this.date = DateTime.parse(map['date']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': this.id,
      'title': this.title,
      'content': this.content,
      'date': this.date.toIso8601String()
    };
  }
}
