import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_my_bakery/models/Market.dart';
import 'package:flutter_my_bakery/models/Payer.dart';
import 'package:flutter_my_bakery/models/Worker.dart';

class SetupDatabaseService {
  final marketsReference =
      FirebaseDatabase.instance.reference().child('bakery').child('markets');
  final workersReference =
      FirebaseDatabase.instance.reference().child('bakery').child('employees');
  final payersReference =
      FirebaseDatabase.instance.reference().child('bakery').child('payers');

  void addMarket(List<Market> markets) {
    for (var market in markets) {
      marketsReference.child(market.name).set(market);
    }
  }

  void addWorkers(List<Worker> workers) {
    for (var worker in workers) {
      workersReference.child(worker.name).set(worker);
    }
  }

  void addPayers(List<Payer> payers) {
    for (var payer in payers) {
      payersReference.child(payer.name).set(payer);
    }
  }
}
