import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../safe/transactions_safe.dart';

class AddingForm extends StatefulWidget {
  const AddingForm({super.key});

  @override
  State<AddingForm> createState() => _AddingFormState();
}

class _AddingFormState extends State<AddingForm> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _countController = TextEditingController();

  DateTime? transactionDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
            left: 20,
        right: 20,
        top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Название покупки',
              ),
              controller: _titleController,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Сумма покупки',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              controller: _countController,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Дата транзакции'),
                transactionDate == null
                    ? TextButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now())
                              .then((value) {
                            setState(
                              () {
                                transactionDate = value;
                              },
                            );
                          });
                        },
                        child: const Text('Выбрать'))
                    : Text(DateFormat('dd.MM.yyyy').format(transactionDate!)),
              ],
            ),
            ElevatedButton(

              onPressed: () {
                if (double.tryParse(_countController.text) == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Сумма введена некорректно'),
                    ),
                  );
                }
                TransactionsSafe().addTransaction(
                  Transaction(
                      count: double.parse(_countController.text),
                      name: _titleController.text,
                      date: transactionDate ?? DateTime.now()),
                );
                Navigator.pop(context);
              },
              child: const Text('Добавить'),
            )
          ],
        ),
      ),
    );
  }
}
