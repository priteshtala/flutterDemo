import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'apply_leave_state.dart';

class ApplyLeaveCubit extends Cubit<ApplyLeaveState> {
  ApplyLeaveCubit()
      : super(
          ApplyLeaveState(
            dateController: TextEditingController(),
            dateTimeController: TextEditingController(),
            reasonController: TextEditingController(),
          ),
        );

  void dateTimePicker(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    DateTime? pickedDate2 = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMMd('en_US').format(pickedDate);
      String formattedDate2 = DateFormat.yMMMMd('en_US').format(pickedDate2!);
      state.dateController.text = formattedDate;
      state.dateTimeController.text = formattedDate2;
    }
    emit(state.copyWith(dateController: state.dateController, dateTimeController: state.dateTimeController));
  }
}
