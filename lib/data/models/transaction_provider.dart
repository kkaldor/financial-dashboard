import 'package:flutter/material.dart';
import 'models/transaction.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> data = [
    TransactionModel(
        title: "Gaji", amount: 8500000, isExpense: false, date: DateTime.now()),
    TransactionModel(
        title: "Makan", amount: 50000, isExpense: true, date: DateTime.now()),
    TransactionModel(
        title: "Transport", amount: 30000, isExpense: true, date: DateTime.now()),
  ];

  double get totalIncome =>
      data.where((e) => !e.isExpense).fold(0, (p, c) => p + c.amount);

  double get totalExpense =>
      data.where((e) => e.isExpense).fold(0, (p, c) => p + c.amount);

  double get netBalance => totalIncome - totalExpense;

  double get monthlyChange => 12.4; // placeholder
}