// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/date_by_leave_model/date_by_leave_model.dart';
import 'package:finaldemo/keka_project/model/leave_today_model/leave_today_model.dart';
import 'package:finaldemo/keka_project/model/login_details/login_details.dart';
import 'package:flutter/material.dart';

class ManagerScreenState extends Equatable {
  @override
  List<Object?> get props => [
        dateList,
        leaveTodayList,
        leaveByDateList,
        employeeCount,
        dateController,
        searchController,
        yesterdayDate,
        profile,
        departmentCount,
        name,
        loginData,
      ];

  List<TodayLeave> leaveTodayList = [];
  List<DateByLeave> leaveByDateList = [];
  List<DateByLeave> dateList = [];
  TextEditingController dateController;
  TextEditingController? searchController;
  var yesterdayDate;
  Profile? profile;
  int? employeeCount;
  int? departmentCount;
  String? name;
  EmployeeLoginDetails? loginData;
  bool? hasError;

  ManagerScreenState({
    required this.dateList,
    required this.dateController,
    required this.leaveTodayList,
    required this.leaveByDateList,
    this.searchController,
    required this.yesterdayDate,
    this.profile,
    this.employeeCount = 0,
    this.departmentCount = 0,
    this.name,
    this.loginData,
    this.hasError = false,
  });

  ManagerScreenState copyWith({
    List<TodayLeave>? leaveTodayList,
    List<TodayLeave>? pendingLeaveList,
    List<DateByLeave>? dateList,
    List<DateByLeave>? leaveByDateList,
    TextEditingController? dateController,
    TextEditingController? searchController,
    var yesterdayDate,
    Profile? profile,
    int? employeeCount,
    int? departmentCount,
    String? name,
    EmployeeLoginDetails? loginData,
    String? Name,
    bool? hasError,
  }) {
    return ManagerScreenState(
      leaveTodayList: leaveTodayList ?? this.leaveTodayList,
      leaveByDateList: leaveByDateList ?? this.leaveByDateList,
      dateList: dateList ?? this.dateList,
      dateController: dateController ?? this.dateController,
      searchController: searchController ?? this.searchController,
      yesterdayDate: yesterdayDate ?? this.yesterdayDate,
      profile: profile ?? this.profile,
      employeeCount: employeeCount ?? this.employeeCount,
      departmentCount: departmentCount ?? this.departmentCount,
      name: name ?? this.name,
      loginData: loginData ?? this.loginData,
      hasError: hasError ?? this.hasError,
    );
  }
}
