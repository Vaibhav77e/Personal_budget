import 'package:flutter/material.dart';

class TransactionBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPot; // Pot - percentage of total.

  TransactionBar(this.label, this.spendingAmount, this.spendingPot);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text('₹ ${spendingAmount.toStringAsFixed(0)}'),
          ),
        ), //spendingAmount.toStringAsFixed(0)}' helps set decimal places
        SizedBox(
          height: 10,
        ), // techincal used for spacing between text and bars
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPot, //requires 1 or 0 as value
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ), //loads widget on above another in 3d view
        ),
        Text(label),

        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
