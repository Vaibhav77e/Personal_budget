import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addTx;

  NewTransactions(this.addTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final _inputTitle = TextEditingController();
  final _inputAmount = TextEditingController();
  DateTime? _selectedDate;
  

  void submitData() {
    if (_inputAmount.text.isEmpty) {
      return;
    }
    final enteredText = _inputTitle.text;
    final double enteredAmount = double.parse(
      _inputAmount //this converts text to integer value(throws if we use text like "hello")
          .text,
    );

    if (enteredText.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredText, enteredAmount,
        _selectedDate); //widget.addTx this keyword helps to access addtx from widget to state

    Navigator.pop(context);
  }

  void _presentDatePicker() {
    //showDatePicker() is a bulit-in fn
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    }); //then is a future function but still fn or methods after this line still excutes without waiting for user i/p
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // it is basically stylized container
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _inputTitle,
               
                onFieldSubmitted: (_) => submitData(),
              ), 

              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller:
                    _inputAmount, ,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_) =>
                    submitData(), 
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date choosen!'
                            : 'Picked Date : ${DateFormat.yMMMd().format(_selectedDate!)}',
                      ),
                    ),
                    TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: submitData,
                child: Text('Add Transcation',
                    style: TextStyle(
                      //Theme.of(context).primaryColor bascially context contains info abut meta data relating to widgets
                      color: Colors
                          .white //.primaryColor used as referwnce to access color of main themedata
                      ,
                    )),
              )
            ]),
      ),
    );
  }
}
