import 'package:flutter/material.dart';
import 'package:metrdev_mobile_test/core/common/svg_icons.dart';
import 'package:metrdev_mobile_test/core/theme/colors.dart';
import 'package:metrdev_mobile_test/core/theme/styles.dart';
import 'package:metrdev_mobile_test/features/dashboard/models/crypto_item.dart';

class CryptoTileItem extends StatelessWidget {
  final CryptoItem item;
  const CryptoTileItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 16,
      ),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: bgLight,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: _containerColorType(item.type).withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: _iconType(
              item.type,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${item.type}USDT".toUpperCase(),
                style: kWhiteText14NormalStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                "${item.percent} %",
                style: kWhiteText15w600Style.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'e-UkraineHead',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconType(String type) {
    switch (type) {
      case "btc":
        return SvgIcons.bitcoinIcon();
      case "eth":
        return SvgIcons.ethereumIcon();
      case "bnb":
        return SvgIcons.bnbIcon();
      default:
        return const Icon(Icons.mode_standby_rounded);
    }
  }

  Color _containerColorType(String type) {
    switch (type) {
      case "btc":
        return Colors.grey;
      case "eth":
        return const Color(0xFFB1BCFF);
      case "bnb":
        return const Color(0xFFF3BA2F);
      default:
        return Colors.grey;
    }
  }
}
