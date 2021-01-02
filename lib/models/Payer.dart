class Payer {
  final String name;
  final double debt;
  Payer({this.name, this.debt});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'debt': debt,
    };
  }
}
