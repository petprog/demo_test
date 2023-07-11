import 'package:flutter/material.dart';

import '../theme/colors.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton(
      {super.key,
      required this.label,
      this.width = 200,
      required this.onButtonPressed});

  final String label;
  final double width;
  final Function()? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonPressed,
      child: Ink(
        width: width,
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: mainGold, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: 80.0,
              minHeight: 36.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
                color: mainGold, fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
