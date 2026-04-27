import 'package:flutter/material.dart';
import '../../core/responsive/responsive_layout.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: 20,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment:
            isMobile ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        children: [
          if (isMobile)
            const Icon(Icons.menu, size: 28),

          if (!isMobile)
            const Text(
              "Financial Dashboard",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

          const Spacer(),

          DropdownButton(
            value: "Monthly",
            items: const [
              DropdownMenuItem(value: "Monthly", child: Text("Monthly")),
              DropdownMenuItem(value: "Yearly", child: Text("Yearly")),
            ],
            onChanged: (v) {},
          ),

          const SizedBox(width: 20),
          const CircleAvatar(child: Icon(Icons.person)),
        ],
      ),
    );
  }
}