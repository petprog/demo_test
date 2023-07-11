import 'package:flutter/material.dart';
import 'package:metrdev_mobile_test/core/common/svg_icons.dart';
import 'package:metrdev_mobile_test/core/theme/styles.dart';

import '../../../../core/utils/asset_constants.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Image.asset(
            AssetConstants.avatar,
            width: 80,
            height: 80,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey, Jacobs",
                style: kWhiteText15w600Style.copyWith(
                  fontSize: 25,
                ),
              ),
              const Text(
                "Welcome back",
                style: kHintText15w600Style,
              ),
            ],
          ),
        ),
        SvgIcons.notificationIcon(),
      ],
    );
  }
}
