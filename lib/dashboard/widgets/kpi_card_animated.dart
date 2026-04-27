import 'package:flutter/material.dart';

class KPIAnimatedCard extends StatefulWidget {
  final Widget child;
  const KPIAnimatedCard({super.key, required this.child});

  @override
  State<KPIAnimatedCard> createState() => _KPIAnimatedCardState();
}

class _KPIAnimatedCardState extends State<KPIAnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController ctrl;
  late Animation<double> fade;
  late Animation<Offset> slide;

  @override
  void initState() {
    super.initState();
    ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: ctrl, curve: Curves.easeOut),
    );

    slide = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: ctrl,
      curve: Curves.easeOut,
    ));

    Future.delayed(const Duration(milliseconds: 150), () {
      ctrl.forward();
    });
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: slide,
        child: widget.child,
      ),
    );
  }
}