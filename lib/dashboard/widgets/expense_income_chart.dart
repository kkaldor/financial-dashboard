import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseIncomeChart extends StatelessWidget {
  final List<double> income;
  final List<double> expense;

  const ExpenseIncomeChart({
    super.key,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 300,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: true),
              lineBarsData: [
                _buildLine(income, Colors.green),
                _buildLine(expense, Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LineChartBarData _buildLine(List<double> values, Color color) {
    return LineChartBarData(
      isCurved: true,
      spots: List.generate(values.length, 
        (i) => FlSpot(i.toDouble(), values[i]),
      ),
      barWidth: 4,
      color: color,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: color.withOpacity(0.15),
      ),
    );
  }
}