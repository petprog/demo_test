import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../../dashboard/view/dashboard.dart';
import '../bloc/home_bloc.dart';
import 'components/bottom_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeInitailEvent());
  }

  List<Widget> pageList = [
    const Dashboard(),
    const Text(
      "Activity Page",
      style: kWhiteText15w600Style,
    ),
    const Text(
      "Setting Page",
      style: kWhiteText15w600Style,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: bg,
          body: SafeArea(
            child: Center(
              child: pageList[state.pageIndex!],
            ),
          ),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
      listener: (context, state) {},
    );
  }
}
