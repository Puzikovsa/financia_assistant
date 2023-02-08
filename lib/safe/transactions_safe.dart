import '../models/transaction.dart';

class TransactionsSafe {

  static TransactionsSafe? _instance;

  TransactionsSafe._internal();

  factory TransactionsSafe() {
    _instance ??= TransactionsSafe._internal();
    return _instance!;
  }

  final List<Function> _callbacks = [];

  final List<Transaction> _transactions = [
  ];

  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    for (var element in _callbacks) {
      element();
    }
  }


  bool deleteTransaction(Transaction transaction) {
    bool result =_transactions.remove(transaction);
    for (var element in _callbacks) {
      element();
    }
    return result;
  }


  void addCallback(Function callback) =>
      _callbacks.add(callback);

  bool deleteCallback(Function callback) =>
      _callbacks.remove(callback);
}