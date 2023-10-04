import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/add_employee/add_employee_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'employee_details_state.dart';

class EmployeeDetailsCubit extends Cubit<EmployeeDetailsState> {
  EmployeeDetailsCubit(this.context, super.initialState);

  BuildContext context;
  String baseurl = "https://57af-136-232-118-126.ngrok-free.app";

  void dropdownSelected(Department value) {
    List<Employee> filtterdUserList = List<Employee>.from(state.filtterdUserList);
    filtterdUserList =
        value.id == 0 ? state.employeeList : state.employeeList.where((e) => e.departmentId == value.id).toList();
    emit(state.copyWith(selectedValue: value, filtterdUserList: filtterdUserList));
  }

  void runFilter(String query) {
    List<Employee> filtterdUserList = List<Employee>.from(state.filtterdUserList);

    if (query.isEmpty) {
      if (state.selectedValue?.id != 0) {
        filtterdUserList = state.employeeList.where((e) => e.departmentId == state.selectedValue?.id).toList();
      } else {
        filtterdUserList = state.employeeList;
      }
    } else {
      if (state.selectedValue?.id != 0) {
        filtterdUserList = filtterdUserList.where((e) {
          return e.name.toString().toLowerCase().contains(query.toLowerCase());
        }).toList();
      } else {
        filtterdUserList = state.employeeList.where((e) {
          return e.name.toString().toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    }

    emit(state.copyWith(filtterdUserList: filtterdUserList));
  }

  void getEmployeeApi({Department? department}) async {
    final response = await Dio().get("$baseurl/api/user");
    List<Employee> employeeDetails = [];

    if (response.statusCode == 200) {
      var data = response.data;
      for (var entry in data) {
        employeeDetails.add(Employee.fromJson(entry));
      }
      employeeDetails.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else {
      Text("No-Data");
    }
    if (department != null) {
      debugPrint("Sele:${department.name}");
      emit(state.copyWith(filtterdUserList: employeeDetails, employeeList: employeeDetails, selectedValue: department));
    } else {
      emit(state.copyWith(filtterdUserList: employeeDetails, employeeList: employeeDetails));
    }
  }

  void getDepartmentApi() async {
    final response = await Dio().get("$baseurl/api/department");
    List<Department> DepartmentListData = [];
    if (response.statusCode == 200) {
      var data = response.data;
      for (var entry in data) {
        DepartmentListData.add(Department.fromJson(entry));
      }
      DepartmentListData.insert(0, Department(id: 0, name: "All", createAt: '', updateAt: ''));
    } else {
      Text("No-Data");
    }
    emit(state.copyWith(departmentList: DepartmentListData, filterDepartmentList: DepartmentListData));
  }

  refresh() {
    var refresh = state.hasError = false;
    state.filtterdUserList.clear();
    emit(state.copyWith(hasError: refresh));
    getEmployeeApi();
  }

  void addEmployee(Profile? arg) {
    Navigator.of(context).pushNamed(AddEmployeeView.routeName, arguments: arg).then((value) {
      if (value == true) {
        debugPrint("State::${state.selectedValue?.id}");
        debugPrint("name::${state.selectedValue?.name}");
        Department selectDep = state.departmentList.firstWhere((element) => element.id == state.selectedValue?.id);
        debugPrint("dep::${selectDep.name}");
        getEmployeeApi(department: selectDep);
      }
    });
  }
}
