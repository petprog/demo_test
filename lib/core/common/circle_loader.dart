import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

import 'package:metrdev_mobile_test/core/theme/colors.dart';

class CircleLoader {
  CircleLoader(this.context, {this.allowBackButton = false});
  final bool allowBackButton;
  final BuildContext context;

  void show() {
    unawaited(
      Navigator.push(
        context,
        PageRouteBuilder(
          fullscreenDialog: true,
          opaque: false,
          barrierColor: Colors.transparent,
          pageBuilder: (_, __, ___) {
            return _CircleIndicator(allowBackButton: allowBackButton);
          },
        ),
      ),
    );
  }

  void close() {
    Navigator.pop(context);
  }
}

class _CircleIndicator extends StatelessWidget {
  const _CircleIndicator({this.allowBackButton = false, Key? key})
      : super(key: key);
  final bool allowBackButton;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(allowBackButton);
      },
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        body: const Center(
          child: SpinKitFadingCircle(
            color: mainGold,
            size: 100,
          ),
        ),
      ),
    );
  }
}
