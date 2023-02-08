import 'package:financia_assistant/pages/adding_form.dart';
import 'package:financia_assistant/pages/charts_list.dart';
import 'package:financia_assistant/pages/transactions_list.dart';
import 'package:financia_assistant/safe/transactions_safe.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.amber.shade400),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Финансовый помощник'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          ChartsList(),
          TransactionsList(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => const AddingForm());
        },
        child: const Icon(Icons.add,
        color: Colors.black87,
        ),
      ),
    );
  }
}
