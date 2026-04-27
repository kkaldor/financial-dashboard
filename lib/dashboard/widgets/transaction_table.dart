import 'package:flutter/material.dart';

class TransactionTable extends StatelessWidget {
  const TransactionTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6)
        ],
      ),
      child: DataTable(
        columns: const [
          DataColumn(label: Text("Date")),
          DataColumn(label: Text("Category")),
          DataColumn(label: Text("Amount")),
          DataColumn(label: Text("Type")),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text("2026-04-01")),
            DataCell(Text("Food")),
            DataCell(Text("Rp 50.000")),
            DataCell(Text("Expense")),
          ]),
          DataRow(cells: [
            DataCell(Text("2026-04-02")),
            DataCell(Text("Salary")),
            DataCell(Text("Rp 5.000.000")),
            DataCell(Text("Income")),
          ]),
        ],
      ),
    );
  }
}