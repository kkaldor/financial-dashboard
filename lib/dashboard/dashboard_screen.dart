import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isDesktop = constraints.maxWidth > 1100;
            final bool isTablet = constraints.maxWidth > 800;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// SIDEBAR (desktop + tablet)
                if (isTablet) _buildSidebar(),

                /// MAIN CONTENT
                Expanded(
                  child: _buildMainContent(context, isDesktop, isTablet),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // Sidebar Navigation
  // ============================================================
  Widget _buildSidebar() {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: const BoxDecoration(
        color: Color(0xFF0E1C36),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "FINANCE PRO",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),
          _sidebarItem(Icons.dashboard, "Dashboard"),
          _sidebarItem(Icons.swap_horiz, "Transactions"),
          _sidebarItem(Icons.folder_copy, "Categories"),
          _sidebarItem(Icons.settings, "Settings"),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.white70),
        title: Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 15,
          ),
        ),
        horizontalTitleGap: 12,
      ),
    );
  }

  // ============================================================
  // MAIN CONTENT
  // ============================================================
  Widget _buildMainContent(
      BuildContext context, bool isDesktop, bool isTablet) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopHeader(),
          const SizedBox(height: 32),
          _buildFinancialSummary(isDesktop, isTablet),
          const SizedBox(height: 32),
          _buildChartsSection(isDesktop),
          const SizedBox(height: 32),
          _buildRecentTransactions(),
        ],
      ),
    );
  }

  // ============================================================
  // Header
  // ============================================================
  Widget _buildTopHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Financial Dashboard",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E1E1E),
          ),
        ),
        Row(
          children: [
            DropdownButton(
              value: "Monthly",
              items: const [
                DropdownMenuItem(value: "Daily", child: Text("Daily")),
                DropdownMenuItem(value: "Weekly", child: Text("Weekly")),
                DropdownMenuItem(value: "Monthly", child: Text("Monthly")),
                DropdownMenuItem(value: "Yearly", child: Text("Yearly")),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(width: 20),
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // Financial Summary Cards
  // ============================================================
  Widget _buildFinancialSummary(bool isDesktop, bool isTablet) {
    final double cardWidth =
    isDesktop ? 330.0 : isTablet ? 250.0 : double.infinity;

    return Wrap(
      spacing: 18,
      runSpacing: 18,
      children: [
        _summaryCard(
          title: "Total Income",
          value: "Rp 12.500.000",
          icon: Icons.trending_up,
          iconColor: Colors.green,
          width: cardWidth,
        ),
        _summaryCard(
          title: "Total Expense",
          value: "Rp 7.320.000",
          icon: Icons.trending_down,
          iconColor: Colors.red,
          width: cardWidth,
        ),
        _summaryCard(
          title: "Net Balance",
          value: "Rp 5.180.000",
          icon: Icons.account_balance_wallet,
          iconColor: Colors.blue,
          width: cardWidth,
        ),
        _summaryCard(
          title: "Monthly Change",
          value: "+12.4%",
          icon: Icons.show_chart,
          iconColor: Colors.teal,
          width: cardWidth,
        ),
      ],
    );
  }

  Widget _summaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    required double width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // ============================================================
  // Chart Placeholder
  // ============================================================
  Widget _buildChartsSection(bool isDesktop) {
    return Container(
      height: isDesktop ? 330 : 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
          ),
        ],
      ),
      child: const Text(
        "Chart Placeholder (Integrate Syncfusion / fl_chart)",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  // ============================================================
  // Recent Transactions
  // ============================================================
  Widget _buildRecentTransactions() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Transactions",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(height: 30),
          ...List.generate(5, (index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.payment, color: Colors.white),
              ),
              title: Text("Payment #$index"),
              subtitle: const Text("27 April 2026"),
              trailing: const Text(
                "- Rp 150.000",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}