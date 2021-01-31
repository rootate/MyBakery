import 'package:flutter/material.dart';

class NewMarket extends StatefulWidget {
  final Function addTx;

  NewMarket(this.addTx);

  @override
  _NewMarketState createState() => _NewMarketState();
}

class _NewMarketState extends State<NewMarket> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _nameController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

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
              decoration: InputDecoration(labelText: 'Adı'),
              controller: _nameController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Borcu'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text(
                'Market Ekle',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              textColor: Colors.blueGrey,
              onPressed: () => _submitData(),
            ),
          ],
        ),
      ),
    );
  }
}
