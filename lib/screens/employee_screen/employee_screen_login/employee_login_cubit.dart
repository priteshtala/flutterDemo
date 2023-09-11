import 'package:bloc/bloc.dart';

import 'employee_login_state.dart';

class EmployeeLoginCubit extends Cubit<EmployeeLoginState> {
  EmployeeLoginCubit(super.initialState);

  void visibility() {
    emit(state.copyWith(iconShowHide: !state.iconShowHide));
  }
}
