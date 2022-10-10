import 'package:flutter/material.dart';
import '../class_models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function deletetx;

  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: TextStyle(
                    fontFamily: 'QuickSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height:
                      30, //Sizedbox provides spacing between text and container
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png'))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                  elevation: 5,
                  child: ListTile(
                      leading: CircleAvatar(
                        
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text('₹${transactions[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        '${transactions[index].title}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        
                        onPressed: () => deletetx(transactions[index]
                            .id), //only passing deletetx as pointer only points at _deleteTransaction but we need wrap deletetx with an anonms fn and pass arg for deletetx
                        icon: Icon(Icons.delete_outline),
                        color: Theme.of(context)
                            .errorColor, //errorColor default color is red
                      )),
                );
              },
              itemCount: transactions.length,
           
            ),
    );
  }
}
