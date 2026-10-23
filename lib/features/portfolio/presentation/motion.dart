import 'package:flutter/material.dart';

class HoverLift extends StatefulWidget {
  final Widget child;
  const HoverLift({super.key, required this.child});
  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    final reduced = MediaQuery.disableAnimationsOf(context);
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: reduced ? Duration.zero : const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform:
            Matrix4.translationValues(0, hovered && !reduced ? -6 : 0, 0),
        child: widget.child,
      ),
    );
  }
}
