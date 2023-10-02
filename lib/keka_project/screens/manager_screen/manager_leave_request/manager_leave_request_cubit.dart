import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/model/leave_today_model/leave_today_model.dart';

import '../../../model/leave_today_model/leave_today_model.dart';
import 'manager_leave_request_state.dart';

class ManagerLeaveRequestCubit extends Cubit<ManagerLeaveRequestState> {
  ManagerLeaveRequestCubit(super.initialState);

  void pendingLeave() async {
    final response = await Dio().get('https://19d1-136-232-118-126.ngrok-free.app/api/all_leaves');
    var pendingLeaveData = List<TodayLeave>.from(state.pendingLeaveList);

    if (response.statusCode == 200) {
      var data = response.data;

      for (var entryJson in data) {
        pendingLeaveData.add(TodayLeave.fromJson(entryJson));
      }
    } else {
      throw Exception('Data Not Available');
    }
    emit(state.copyWith(pendingLeaveList: pendingLeaveData));
  }

  Future updateLeaveRequests(String status,int index) async {
    var data = {
      "status": status,
    };
    print("updateStatus::$data");
    print("UserId=============UserId==========UserId=======UserId========UserId===${state.pendingLeaveList[index].id}");

    final response = await Dio().put(
      "https://19d1-136-232-118-126.ngrok-free.app/api/update_leave_status/${state.pendingLeaveList[index].id ?? ""}",
      data: data,
      options: Options(
          headers: {"Accept": "application/json"}),

    );
    // navigatorToEmployee(context);
    print("status code================${response.data}");
  }

  Date(index) {
    var dateTime1 = DateTime.parse("${state.pendingLeaveList[index].startDate}");
    var dateTime2 = DateTime.parse("${state.pendingLeaveList[index].endDate}");

    var format = "${dateTime1.year}-${dateTime1.month}-${dateTime1.day}";
    var format1 = "${dateTime2.year}-${dateTime2.month}-${dateTime2.day}";
    emit(state.copyWith(startDate: format, endDate: format1));
  }

  refresh() {
    var refresh = state.hasError = false;
    state.pendingLeaveList.clear();
    emit(state.copyWith(hasError: refresh));
    return pendingLeave();
  }
}
