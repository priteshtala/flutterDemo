import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/leave_today_model/leave_today_model.dart';

class ManagerLeaveRequestState extends Equatable {
  @override
  List<Object?> get props => [pendingLeaveList,startDate,endDate];

  List<TodayLeave> pendingLeaveList = [];
  String? startDate;
  String? endDate;

  ManagerLeaveRequestState({
    required this.pendingLeaveList,
    this.startDate,
    this.endDate,
});

  ManagerLeaveRequestState copyWith({
    List<TodayLeave>? pendingLeaveList,
    String? startDate,
    String? endDate,
  }) {
    return ManagerLeaveRequestState(
      pendingLeaveList: pendingLeaveList ?? this.pendingLeaveList,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
