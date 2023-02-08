import 'package:financia_assistant/pages/transaction_element.dart';
import 'package:flutter/material.dart';
import '../safe/transactions_safe.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({super.key});

  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  late Function callback;

  @override
  void  initState(){
    callback = () {
      setState(() {
      });
    };
    TransactionsSafe().addCallback((callback));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, position) => TransactionElement(
          transaction: TransactionsSafe().transactions[position],
        ),
        itemCount: TransactionsSafe().transactions.length,
      ),
    );
  }
  @override
  void dispose(){
    super.dispose();
  TransactionsSafe().deleteCallback(callback);
  }
}
