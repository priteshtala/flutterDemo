import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/leave_model/leave_model.dart';
import 'package:flutter/material.dart';

class ManagerScreenState extends Equatable {
  @override
  List<Object?> get props => [leaveList, dateController, searchController,];

  List<Leave> leaveList = [];
  TextEditingController dateController = TextEditingController();
  TextEditingController? searchController;

  ManagerScreenState(
      {required this.leaveList, required this.dateController, this.searchController,});

  ManagerScreenState copyWith({
    List<Leave>? leaveList,
    TextEditingController? dateController,
    TextEditingController? searchController,
  }) {
    return ManagerScreenState(
      leaveList: leaveList ?? this.leaveList,
      dateController: dateController ?? this.dateController,
      searchController: searchController ?? this.searchController,
    );
  }
}
