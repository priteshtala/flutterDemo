import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/model/leave_today_model/leave_today_model.dart';
import 'package:flutter/material.dart';
import 'manager_leave_request_state.dart';

class ManagerLeaveRequestCubit extends Cubit<ManagerLeaveRequestState> {
  ManagerLeaveRequestCubit(super.initialState);

  void pendingLeave() async {
    final response = await Dio().get('https://1f35-136-232-118-126.ngrok-free.app/api/all_leaves');
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

  Future updateLeaveRequests(String status, int index) async {
    var data = {
      "status": status,
    };
    final response = await Dio().put(
      "https://1f35-136-232-118-126.ngrok-free.app/api/update_leave_status/${state.pendingLeaveList[index].id}",
      data: data,
      options: Options(headers: {"Accept": "application/json"}),
    );
    print("status code================${response.data}");
  }

  refresh() {
    var refresh = state.hasError = false;
    state.pendingLeaveList.clear();
    emit(state.copyWith(hasError: refresh));
    return pendingLeave();
  }

  void navigateToManager(context) {
    Navigator.of(context).pop();
  }
}
