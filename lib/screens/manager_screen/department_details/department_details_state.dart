import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';

class  DepartmentDetailsState extends Equatable{
  @override
  List<Object?> get props => [];
  List<Department> departmentList = [];

  DepartmentDetailsState({required this.departmentList});

  DepartmentDetailsState copyWith({
    List<Department>? departmentList,
  }) {
    return DepartmentDetailsState(
      departmentList: departmentList ?? this.departmentList,
    );
  }
}