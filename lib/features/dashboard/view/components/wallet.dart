import 'package:flutter/material.dart';
import 'package:metrdev_mobile_test/core/utils/asset_constants.dart';
import 'package:metrdev_mobile_test/core/utils/utility.dart';

import '../../../../core/common/svg_icons.dart';
import '../../../../core/theme/styles.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    Utility.debugPrint(MediaQuery.of(context).size.height);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.22,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AssetConstants.cardBg,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                AssetConstants.noise,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Wallet",
                          style: kWhiteText14NormalStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgIcons.whiteBinanceIcon(),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Binance",
                                style: kWhiteText14NormalStyle.copyWith(
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account Balance",
                          style: kWhiteText14NormalStyle.copyWith(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "\$ 12,480.00",
                          style: kWhiteText15w600Style.copyWith(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'e-UkraineHead',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
