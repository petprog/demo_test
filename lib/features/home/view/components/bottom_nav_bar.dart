import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:metrdev_mobile_test/core/theme/colors.dart';
import 'package:metrdev_mobile_test/core/utils/asset_constants.dart';
import '../../bloc/home_bloc.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AssetConstants.bottomNavBg,
                )),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeChangePageEvent(pageIndex: 0));
                },
                icon:
                    state.pageIndex == 0 ? IconlyBold.graph : IconlyLight.graph,
                color: state.pageIndex == 0 ? mainGold : Colors.white,
              ),
              BottomNavItem(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeChangePageEvent(pageIndex: 1));
                },
                icon: state.pageIndex == 1
                    ? IconlyBold.activity
                    : IconlyLight.activity,
                color: state.pageIndex == 1 ? mainGold : Colors.white,
              ),
              BottomNavItem(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeChangePageEvent(pageIndex: 2));
                },
                icon: state.pageIndex == 2
                    ? IconlyBold.setting
                    : IconlyLight.setting,
                color: state.pageIndex == 2 ? mainGold : Colors.white,
              ),
            ],
          ),
        ),
      );
    });
  }
}
