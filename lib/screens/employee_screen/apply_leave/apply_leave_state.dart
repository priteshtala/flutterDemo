import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ApplyLeaveState extends Equatable {
  @override
  List<Object?> get props => [];
  TextEditingController dateController = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  ApplyLeaveState({required this.dateController, required this.dateTimeController, required this.reasonController});

  ApplyLeaveState copyWith({
    TextEditingController? dateController,
    TextEditingController? dateTimeController,
    TextEditingController? reasonController,
  }) {
    return ApplyLeaveState(
      dateController: dateController ?? this.dateController,
      dateTimeController: dateTimeController ?? this.dateTimeController,
      reasonController: reasonController ?? this.reasonController,
    );
  }
}
