import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/leave_today_model/leave_today_model.dart';
import 'package:finaldemo/keka_project/model/login_details/login_details.dart';

class ManagerLeaveRequestState extends Equatable {
  @override
  List<Object?> get props => [pendingLeaveList,startDate,endDate,hasError,loginData,profile];

  List<TodayLeave> pendingLeaveList = [];
  String? startDate;
  String? endDate;
  bool? hasError;
  EmployeeLoginDetails? loginData;
  Profile? profile;


  ManagerLeaveRequestState({
    required this.pendingLeaveList,
    this.startDate,
    this.endDate,
    this.hasError = false,
    this.loginData,
    this.profile
});

  ManagerLeaveRequestState copyWith({
    List<TodayLeave>? pendingLeaveList,
    String? startDate,
    String? endDate,
    bool? hasError,
    EmployeeLoginDetails? loginData,
    Profile? profile,


  }) {
    return ManagerLeaveRequestState(
      pendingLeaveList: pendingLeaveList ?? this.pendingLeaveList,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      hasError: hasError ?? this.hasError,
      loginData: loginData ?? this.loginData,
      profile: profile ?? this.profile,

    );
  }
}
