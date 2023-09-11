import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/leave_model/leave_model.dart';

class  DepartmentDetailsState extends Equatable{
  @override
  List<Object?> get props => [departmentList,leaveSearchList];
  List<Department> departmentList = [];
  List<Department> leaveSearchList;


  DepartmentDetailsState({required this.departmentList, this.leaveSearchList = const []});

  DepartmentDetailsState copyWith({
    List<Department>? departmentList,
    List<Department>? leaveSearchList,
  }) {
    return DepartmentDetailsState(
      departmentList: departmentList ?? this.departmentList,
      leaveSearchList: leaveSearchList ?? this.leaveSearchList,
    );
  }
}