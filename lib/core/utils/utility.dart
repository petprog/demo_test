import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/status_dialog.dart';
import '../theme/colors.dart';

class Utility {
  static debugPrint(Object msg) {
    if (kDebugMode) {
      print(msg);
    }
  }

  static void showStatusDialog(
      {required BuildContext context,
      String? desc,
      String? title,
      String? imageAsset,
      bool? showImage,
      bool? showPositiveButton,
      bool? showNegativeButton,
      Function()? onPositive,
      Function()? onNegative,
      String? positiveText,
      bool dismissAble = true,
      String? negativeText}) {
    showDialog(
      context: context,
      barrierDismissible: dismissAble,
      builder: (BuildContext context) => Dialog(
        backgroundColor: bg,
        alignment: Alignment.center,
        insetPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: StatusDialog(
          desc: desc,
          title: title,
          assetImage: imageAsset,
          showImage: showImage,
          showPositiveButton: showPositiveButton,
          showNegativeButton: showNegativeButton,
          onPositive: () =>
              {Navigator.pop(context), if (onPositive != null) onPositive()},
          onNegative: () =>
              {Navigator.pop(context), if (onNegative != null) onNegative()},
          positiveText: positiveText,
          negativeText: negativeText,
        ),
      ),
    );
  }

  static showAlert(BuildContext context, String? title, String? error) {
    String msg = error ?? 'An unknown error occurred. Please contact support';
    showStatusDialog(
        context: context,
        title: title ?? "Error",
        desc: msg,
        showPositiveButton: true,
        positiveText: "Close",
        showImage: false);
  }
}
