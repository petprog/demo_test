import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'white_button.dart';
import '../utils/extension.dart';

import 'primary_button.dart';

class StatusDialog extends StatelessWidget {
  const StatusDialog(
      {this.desc,
      this.title,
      this.assetImage,
      this.onPositive,
      this.onNegative,
      this.showNegativeButton,
      this.showPositiveButton,
      this.showImage,
      this.positiveText,
      this.negativeText,
      key})
      : super(key: key);

  final String? title;
  final String? desc;
  final String? assetImage;
  final bool? showPositiveButton;
  final bool? showNegativeButton;
  final bool? showImage;
  final Function()? onPositive;
  final Function()? onNegative;
  final String? positiveText;
  final String? negativeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: (showPositiveButton != false && showNegativeButton != false)
          ? double.infinity
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Visibility(
            visible: showImage ?? true,
            child: Image.asset(
              "images/${assetImage ?? "image_accept.png"}",
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: !title.isNullOrEmpty,
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            desc!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: gray,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Visibility(
            visible: showPositiveButton ?? false,
            child: PrimaryButton(
              label: positiveText ?? "OK",
              width: double.infinity,
              onButtonPressed: onPositive,
            ),
          ),
          Visibility(
            visible: showNegativeButton ?? false,
            child: WhiteButton(
              label: negativeText ?? "Cancel",
              width: double.infinity,
              onButtonPressed: onNegative,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
