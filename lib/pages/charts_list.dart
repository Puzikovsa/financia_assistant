import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../safe/transactions_safe.dart';
import 'chart_element.dart';

class ChartsList extends StatefulWidget {
  const ChartsList({super.key});

  @override
  State<ChartsList> createState() => _ChartsListState();
}

class _ChartsListState extends State<ChartsList> {

  @override
  initState(){
    super.initState();
    initializeDateFormatting();
    TransactionsSafe().addCallback(() {
      setState(() {
      });
    });
  }
  
  List<Map<String, dynamic>> get groupTransactions =>
      List
          .generate(
        7,
            (index) {
          final weekDay = DateTime.now().subtract(Duration(days: index));

          var totalSum = 0.0;
          for (var transaction in TransactionsSafe().transactions) {
            if (transaction.date.day == weekDay.day &&
                transaction.date.month == weekDay.month &&
                transaction.date.year == weekDay.year) {
              totalSum += transaction.count;
            }
          }
          return {
            'day': DateFormat.E('ru_RU').format(weekDay),
            'amount': totalSum
          };
        },
      )
          .reversed
          .toList();

  double get totalSpending =>
      groupTransactions.fold(
        0.0,
            (sum, element) => sum += element['amount'],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            groupTransactions.map((date) =>
                ChartElement(
                    title: date['day'],
                    count: date['amount'],
                    percentCount: totalSpending == 0 ? 0.0 :
                    date['amount']/totalSpending)).toList(),
          ),
        ),
      ),
    );
  }
}
