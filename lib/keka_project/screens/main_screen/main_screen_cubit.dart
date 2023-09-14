import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit(super.initialState);

  void isSelectedColor(int i) {
    if (state.isSelected == i) {
      emit(state.copyWith(isSelected: -1));
    } else {
      emit(state.copyWith(isSelected: i));
    }

    debugPrint("IsChange ::: ${state.isSelected}");
  }

}
