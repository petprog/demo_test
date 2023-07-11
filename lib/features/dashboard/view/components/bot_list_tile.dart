import 'package:flutter/material.dart';
import 'package:metrdev_mobile_test/core/theme/colors.dart';
import 'package:metrdev_mobile_test/core/theme/styles.dart';
import 'package:metrdev_mobile_test/features/dashboard/models/bot_item.dart';

class BotListTile extends StatelessWidget {
  final BotItem item;
  const BotListTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: bgLight,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  item.name,
                  style: kWhiteText14NormalStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                item.type,
                style: kHintText15w600Style,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              color: item.isActive
                  ? active.withOpacity(0.1)
                  : hintText.withOpacity(0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Text(
              item.isActive ? " ●  Active" : "●  Inactive",
              style: item.isActive
                  ? kHintText14w600Style.copyWith(color: active)
                  : kHintText14w600Style,
            ),
          )
        ],
      ),
    );
  }
}
