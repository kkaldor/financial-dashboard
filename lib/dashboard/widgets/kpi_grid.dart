import 'package:flutter/material.dart';
import '../../core/responsive/responsive_layout.dart';

class KPIGrid extends StatelessWidget {
  const KPIGrid({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = ResponsiveLayout.isDesktop(context)
        ? 4
        : ResponsiveLayout.isTablet(context)
            ? 2
            : 1;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 2.6,
      children: [
        kpiCard("Total Income", "Rp 12.500.000", Icons.arrow_downward, Colors.green),
        kpiCard("Total Expense", "Rp 7.320.000", Icons.arrow_upward, Colors.red),
        kpiCard("Net Balance", "Rp 5.180.000", Icons.account_balance_wallet, Colors.blue),
        kpiCard("Monthly Change", "+12.4%", Icons.show_chart, Colors.teal),
      ],
    );
  }

  Widget kpiCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 28, color: color),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 6),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}