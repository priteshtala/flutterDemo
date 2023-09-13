import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:flutter/cupertino.dart';

class  DepartmentDetailsState extends Equatable{
  @override
  List<Object?> get props => [departmentList,leaveSearchList];
  List<Department> departmentList = [];
  List<Department> leaveSearchList;
  TextEditingController?addDepartmentController;


  DepartmentDetailsState({required this.departmentList, this.leaveSearchList = const [],this.addDepartmentController});

  DepartmentDetailsState copyWith({
    List<Department>? departmentList,
    List<Department>? leaveSearchList,
    TextEditingController? addDepartmentController,
  }) {
    return DepartmentDetailsState(
      departmentList: departmentList ?? this.departmentList,
      leaveSearchList: leaveSearchList ?? this.leaveSearchList,
      addDepartmentController: addDepartmentController ?? this.addDepartmentController,
    );
  }
}