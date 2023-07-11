import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../models/bot_item.dart';
import '../models/crypto_item.dart';
import 'components/bot_list_tile.dart';
import 'components/crypto_tile_item.dart';
import 'components/header.dart';
import 'components/wallet.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late ScrollController _scrollController;
  int _selectedTab = 0;
  void _onTabClicked(int position) {
    setState(() {
      _selectedTab = position;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  Widget _tabItem(String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabClicked(index),
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: _selectedTab == index ? bgLight : null,
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: kWhiteText14NormalStyle,
            ),
          ),
        ),
      ),
    );
  }

  List<CryptoItem> cryptos = [
    CryptoItem(type: 'btc', percent: 36.77),
    CryptoItem(type: 'eth', percent: 24.77),
    CryptoItem(type: 'bnb', percent: 36.07),
  ];

  List<BotItem> items = [
    BotItem(
      id: "1",
      name: "EMA Cross 50  200 + ADX (Long)",
      type: "Distribution Bot",
      isActive: true,
    ),
    BotItem(
      id: "2",
      name: "EMA Cross 50  200 + ADX (Long)",
      type: "Distribution Bot",
      isActive: false,
    ),
    BotItem(
      id: "3",
      name: "EMA Cross 50  200 + ADX (Long)",
      type: "Distribution Bot",
      isActive: true,
    ),
    BotItem(
      id: "3",
      name: "EMA Cross 50  200 + ADX (Long)",
      type: "Distribution Bot",
      isActive: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Header(),
          const SizedBox(
            height: 16,
          ),
          const WalletCard(),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.195,
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              radius: const Radius.circular(3),
              scrollbarOrientation: ScrollbarOrientation.bottom,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: cryptos.length,
                  itemBuilder: (_, index) {
                    return CryptoTileItem(
                      item: cryptos[index],
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                _tabItem("Signal Groups", 0),
                const SizedBox(
                  width: 5,
                ),
                _tabItem("Bots", 1),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _selectedTab == 0
              ? Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      return BotListTile(
                        item: items[index],
                      );
                    },
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      return BotListTile(
                        item: items[index],
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
