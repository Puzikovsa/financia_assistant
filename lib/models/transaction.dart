import 'package:intl/intl.dart';

class Transaction {
  late int id;
  double count;
  String name;
  DateTime date;

  static int allID = 0;

  Transaction({required this.count, required this.name, required this.date}) {
    id = allID++;
  }

  String get dateString => DateFormat('dd.MM.yyyy').format(date);
}
