import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const Btn({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: Color(0xffed7738),
            child: child,
          ),
        ));
  }
}
