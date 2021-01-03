class Worker {
  final String name;
  final String mail;
  final String job;

  Worker({this.name, this.mail, this.job});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mail': mail,
      'job' : job,
    };
  }
}
