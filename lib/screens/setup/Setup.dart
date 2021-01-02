import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_my_bakery/models/Market.dart';
import 'package:flutter_my_bakery/models/Payer.dart';
import 'package:flutter_my_bakery/models/Worker.dart';
import 'package:flutter_my_bakery/models/Product.dart';

class SetupDatabaseService {
  final marketsReference =
      FirebaseDatabase.instance.reference().child('bakery').child('markets');
  final workersReference =
      FirebaseDatabase.instance.reference().child('bakery').child('employees');
  final payersReference =
      FirebaseDatabase.instance.reference().child('bakery').child('payers');
  final categoryReference =
      FirebaseDatabase.instance.reference().child('bakery').child('categories');

  void addMarket(Market market) {
    marketsReference.child(market.name).set(market.toMap());
  }

  void deleteMarket(String marketName) {
    marketsReference.child(marketName).remove();
  }

  void addWorker(Worker worker) {
    workersReference.child(worker.name).set(worker.toMap());
  }

  void deleteWorker(String workerName) {
    workersReference.child(workerName).remove();
  }

  void addPayer(Payer payer) {
    payersReference.child(payer.name).set(payer.toMap());
  }

  void deletePayer(String payerName) {
    payersReference.child(payerName).remove();
  }

  void addProduct(Product product) {
    categoryReference
        .child(product.category)
        .child(product.name)
        .set(product.toMap());
  }

  void deleteProduct(Product product) {
    categoryReference.child(product.category).child(product.name).remove();
  }
}
