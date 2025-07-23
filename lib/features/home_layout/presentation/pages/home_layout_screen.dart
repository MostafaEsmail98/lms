import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/strings.dart';
import '../manager/home_layout_cubit.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
        builder: (context, state) {
          return state.getWidget();
        },
      ),
      bottomNavigationBar: FlashyTabBar(
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        selectedIndex: selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          selectedIndex = index;
          context.read<HomeLayoutCubit>().changeScreen(index);
        }),
        items: [
          FlashyTabBarItem(
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            icon: const Icon(Icons.home, size: 30),
            title: Text(AppStrings.home),
          ),
          FlashyTabBarItem(
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            icon: const Icon(Icons.live_tv, size: 30),
            title: Text(AppStrings.courses),
          ),
          FlashyTabBarItem(
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            icon: const Icon(Icons.person, size: 30),
            title: Text(AppStrings.profile),
          ),
        ],
      ),
    );
  }
}
