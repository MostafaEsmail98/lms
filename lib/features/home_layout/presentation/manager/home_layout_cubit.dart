import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../home/presentation/pages/home_screen.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeScreenState());
  changeScreen(int index) {
    switch (index) {
      case 0:
        emit(HomeScreenState());
        break;
    }
  }
}
