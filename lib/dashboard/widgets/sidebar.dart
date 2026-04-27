import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final bool isCollapsed;

  const Sidebar({super.key, this.isCollapsed = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCollapsed ? 80 : 250,
      color: const Color(0xFF0A1A3A),
      child: Column(
        children: [
          const SizedBox(height: 40),
          _menuItem(Icons.dashboard, "Dashboard", isCollapsed),
          _menuItem(Icons.list, "Transactions", isCollapsed),
          _menuItem(Icons.category, "Categories", isCollapsed),
          _menuItem(Icons.settings, "Settings", isCollapsed),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, bool collapsed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 26),
          if (!collapsed) ...[
            const SizedBox(width: 16),
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 16)),
          ]
        ],
      ),
    );
  }
}