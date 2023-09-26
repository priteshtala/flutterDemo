// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:finaldemo/keka_project/model/leave_model/leave_model.dart';
import 'package:finaldemo/keka_project/model/leave_today_model/leave_today_model.dart';
import 'package:flutter/material.dart';

class ManagerScreenState extends Equatable {
  @override
  List<Object?> get props => [leaveList,leaveTodayList, count,dateController, searchController, yesterdayDate, profile];

  List<Leave> leaveList = [];
  List<TodayLeave> leaveTodayList = [];
  List<TodayLeave> leaveByDateList = [];
  TextEditingController dateController;
  TextEditingController? searchController;
  var yesterdayDate;
  Profile? profile;
  List<Employee>? count;

  ManagerScreenState(
      {required this.leaveList, required this.dateController,required this.leaveTodayList,required this.leaveByDateList, this.searchController, required this.yesterdayDate, this.profile,this.count});

  ManagerScreenState copyWith({
    List<Leave>? leaveList,
    List<TodayLeave>? leaveTodayList,
    List<TodayLeave>? leaveByDateList,
    TextEditingController? dateController,
    TextEditingController? searchController,
    var yesterdayDate,
    Profile? profile,
    List<Employee>? count,


  }) {
    return ManagerScreenState(
      leaveList: leaveList ?? this.leaveList,
      leaveTodayList: leaveTodayList ?? this.leaveTodayList,
      leaveByDateList: leaveByDateList ?? this.leaveByDateList,
      dateController: dateController ?? this.dateController,
      searchController: searchController ?? this.searchController,
      yesterdayDate: yesterdayDate ?? this.yesterdayDate,
      profile: profile ?? this.profile,
      count: count ?? this.count,
    );
  }
}
