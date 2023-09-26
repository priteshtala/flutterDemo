// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/leave_today_model/leave_today_model.dart';
import 'package:flutter/material.dart';

class ManagerScreenState extends Equatable {
  @override
  List<Object?> get props => [leaveTodayList, employeeCount, dateController, searchController, yesterdayDate, profile,departmentCount,name];

  List<TodayLeave> leaveTodayList = [];
  List<TodayLeave> leaveByDateList = [];
  List<TodayLeave> dateList = [];
  TextEditingController dateController;
  TextEditingController? searchController;
  var yesterdayDate;
  Profile? profile;
  int? employeeCount;
  int? departmentCount;
  String? name;

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
  });

  ManagerScreenState copyWith({
    List<TodayLeave>? leaveTodayList,
    List<TodayLeave>? dateList,
    List<TodayLeave>? leaveByDateList,
    TextEditingController? dateController,
    TextEditingController? searchController,
    var yesterdayDate,
    Profile? profile,
    int? employeeCount,
    int? departmentCount,
    String? Name,

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
    );
  }
}
