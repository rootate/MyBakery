import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/SetupScreen/models/Worker.dart';

class NewWorker extends StatefulWidget {
  final Function addWr;

  NewWorker(this.addWr);

  @override
  _NewWorkerState createState() => _NewWorkerState();
}

class _NewWorkerState extends State<NewWorker> {
  final _nameController = TextEditingController();
  final _mailController = TextEditingController();

  void _submitData() {
    final enteredTitle = _nameController.text;
    final enteredJob = _value;
    final enteredMail = _mailController;

    if (enteredTitle.isEmpty) {
      return;
    }

    widget.addWr(
      enteredTitle,
      enteredMail,
      enteredJob,
    );

    Navigator.of(context).pop();
  }

  jobs _value = jobs.yonetici;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Ad'),
              controller: _nameController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Mail'),
              controller: _mailController,
              onSubmitted: (_) => _submitData(),
            ),
            DropdownButton<jobs>(
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                items: jobs.values.map((jobs gorevler) {
                  return DropdownMenuItem(
                    child: Text(gorevler.toString()),
                    value: gorevler,
                  );
                }).toList()),
            FlatButton(
              child: Text('Çalışan Ekle'),
              textColor: Colors.blue,
              onPressed: () => _submitData(),
            ),
          ],
        ),
      ),
    );
  }
}
