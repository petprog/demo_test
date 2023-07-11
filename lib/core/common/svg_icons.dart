import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/asset_constants.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double size;
  const SvgIcon({super.key, required this.assetName, required this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: size,
      height: size,
    );
  }
}

class SvgIcons {
  static Widget googleIcon() {
    return SvgIcon(
      assetName: AssetConstants.google,
      size: 35,
    );
  }

  static Widget appleIcon() {
    return SvgIcon(
      assetName: AssetConstants.apple,
      size: 35,
    );
  }

  static Widget notificationIcon() {
    return SvgIcon(
      assetName: AssetConstants.notification,
      size: 30,
    );
  }

  static Widget whiteBinanceIcon() {
    return SvgIcon(
      assetName: AssetConstants.whiteBinance,
      size: 22,
    );
  }

  static Widget bitcoinIcon() {
    return SvgIcon(
      assetName: AssetConstants.bitcoin,
      size: 24,
    );
  }

  static Widget ethereumIcon() {
    return SvgIcon(
      assetName: AssetConstants.ethereum,
      size: 24,
    );
  }

  static Widget bnbIcon() {
    return SvgIcon(
      assetName: AssetConstants.bnb,
      size: 24,
    );
  }
}
