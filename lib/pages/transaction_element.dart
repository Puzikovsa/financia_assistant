import 'package:financia_assistant/models/transaction.dart';
import 'package:financia_assistant/safe/transactions_safe.dart';
import 'package:flutter/material.dart';

class TransactionElement extends StatelessWidget {
  Transaction transaction;

  TransactionElement({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.purple,
                ),
                child: Text(
                  '${(transaction.count).toStringAsFixed(2)}\n руб.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const VerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                  ),
                  const Divider(
                    height: 5,
                  ),
                  Text(
                    transaction.dateString,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () {
                  TransactionsSafe().deleteTransaction(transaction);
                },
                icon: const Icon(
                  (Icons.delete),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
