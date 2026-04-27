import 'package:flutter/material.dart';
import 'widgets/sidebar.dart';
import 'widgets/topbar.dart';
import 'widgets/finance_card.dart';
import 'widgets/chart_section.dart';
import 'widgets/transaction_table.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView(
                      children: [
                        _buildKPISection(),
                        const SizedBox(height: 24),
                        const ChartSection(),
                        const SizedBox(height: 24),
                        const TransactionTable(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildKPISection() {
    return Row(
      children: const [
        Expanded(
          child: FinanceCard(
            title: "Total Income",
            value: "Rp 12.500.000",
            icon: Icons.arrow_downward,
            color: Colors.green,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: FinanceCard(
            title: "Total Expense",
            value: "Rp 7.320.000",
            icon: Icons.arrow_upward,
            color: Colors.red,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: FinanceCard(
            title: "Net Balance",
            value: "Rp 5.180.000",
            icon: Icons.account_balance_wallet,
            color: Colors.blue,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: FinanceCard(
            title: "Monthly Change",
            value: "+12.4%",
            icon: Icons.trending_up,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}