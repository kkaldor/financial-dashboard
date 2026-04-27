class TransactionModel {
  final String title;
  final double amount;
  final bool isExpense;
  final DateTime date;

  TransactionModel({
    required this.title,
    required this.amount,
    required this.isExpense,
    required this.date,
  });
}