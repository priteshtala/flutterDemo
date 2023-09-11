import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/leave_model/leave_model.dart';
import 'package:flutter/material.dart';

class ManagerScreenState extends Equatable {
  @override
  List<Object?> get props => [leaveList];

  List<Leave> leaveList = [];
  TextEditingController dateController = TextEditingController();

  ManagerScreenState({required this.leaveList, required this.dateController});

  ManagerScreenState copyWith({
    List<Leave>? leaveList,
    TextEditingController? dateController,
  }) {
    return ManagerScreenState(
      leaveList: leaveList ?? this.leaveList,
      dateController: dateController ?? this.dateController,
    );
  }
}
