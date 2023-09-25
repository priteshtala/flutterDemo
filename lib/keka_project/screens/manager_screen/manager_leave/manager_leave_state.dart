// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/leave_model/leave_model.dart';
import 'package:flutter/material.dart';

class ManagerScreenState extends Equatable {
  @override
  List<Object?> get props => [leaveList, dateController, searchController, yesterdayDate, profile];

  List<Leave> leaveList = [];
  TextEditingController dateController;
  TextEditingController? searchController;
  var yesterdayDate;
  Profile? profile;

  ManagerScreenState(
      {required this.leaveList, required this.dateController, this.searchController, required this.yesterdayDate, this.profile});

  ManagerScreenState copyWith({
    List<Leave>? leaveList,
    TextEditingController? dateController,
    TextEditingController? searchController,
    var yesterdayDate,
    Profile? profile,

  }) {
    return ManagerScreenState(
      leaveList: leaveList ?? this.leaveList,
      dateController: dateController ?? this.dateController,
      searchController: searchController ?? this.searchController,
      yesterdayDate: yesterdayDate ?? this.yesterdayDate,
      profile: profile ?? this.profile,
    );
  }
}
