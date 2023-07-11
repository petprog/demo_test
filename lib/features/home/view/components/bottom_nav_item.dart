import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final Color? color;
  const BottomNavItem({
    Key? key,
    this.onTap,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Ink(
          child: Icon(
            icon,
            color: color,
            size: 26,
          ),
        ),
      ),
    );
  }
}
