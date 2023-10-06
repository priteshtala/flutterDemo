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
  String baseurl = "https://cd97-136-232-118-126.ngrok-free.app";

  void dropdownSelected(Department value) {
    List<Employee> filtterdUserList;
    filtterdUserList =
        value.id == 0 ? state.employeeList : state.employeeList.where((e) => e.departmentId == value.id).toList();
    emit(state.copyWith(selectedValue: value, filtterdUserList: filtterdUserList));
  }

  // void runFilter(String query) {
  //   List<Employee> filtterdUserList = [];
  //
  //   if (query.isEmpty) {
  //     if (state.selectedValue?.id != 0) {
  //       filtterdUserList = state.employeeList.where((e) => e.departmentId == state.selectedValue?.id).toList();
  //     } else {
  //       filtterdUserList = state.employeeList;
  //     }
  //   } else {
  //     if (state.selectedValue?.id != 0) {
  //       filtterdUserList = state.employeeList
  //           .where(
  //               (e) => e.departmentId == state.selectedValue?.id && e.name.toLowerCase().contains(query.toLowerCase()))
  //           .toList();
  //     } else {
  //       filtterdUserList = state.employeeList.where((e) {
  //         return e.name.toString().toLowerCase().contains(query.toLowerCase());
  //       }).toList();
  //     }
  //   }
  //
  //   emit(state.copyWith(filtterdUserList: filtterdUserList));
  // }
  void runFilter(String query) {
    List<Employee> filteredUserList = List<Employee>.from(state.employeeList);

    if (query.isNotEmpty) {
      filteredUserList = filteredUserList.where((e) {
        return e.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    if (state.selectedValue?.id != 0) {
      filteredUserList = filteredUserList.where((e) {
        return e.departmentId == state.selectedValue?.id;
      }).toList();
    }

    emit(state.copyWith(filtterdUserList: filteredUserList));
  }

  void getEmployeeApi({Department? department}) async {
    final response = await Dio().get("$baseurl/api/user");
    List<Employee> employeeDetails = [];

    if (response.statusCode == 200) {
      List<Employee> data = (response.data as List).map((e) => Employee.fromJson(e)).toList();
      employeeDetails.addAll(data);
      employeeDetails.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      if (department != null) {
        debugPrint("Sele:${department.name}");
        debugPrint("employeeDetails :${employeeDetails.first.department.name}");

        var selectedEmployeeList =
        employeeDetails.where((element) => element.department.name == department.name).toList();

        debugPrint("selectedEmployeeList ::${selectedEmployeeList.length}");

        emit(state.copyWith(
            filtterdUserList: selectedEmployeeList, employeeList: employeeDetails, selectedValue: department));
      } else {
        emit(state.copyWith(
            filtterdUserList: employeeDetails,
            employeeList: employeeDetails,
            selectedValue: state.departmentList.firstWhere((element) => element.name == "All")));
      }
    } else {
      Text("No-Data");
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

  addEmployee(Profile? arg) {
    Department selectDep = state.departmentList.firstWhere((element) => element.name == state.selectedValue?.name);
    emit(state.copyWith(selectedValue: selectDep));

    Navigator.of(context).pushNamed(AddEmployeeView.routeName, arguments: arg).then((value) {
      if (value == true) {
        debugPrint("id::${state.selectedValue?.id}");
        debugPrint("name::${state.selectedValue?.name}");
        // debugPrint("dep::${selectDep.name}");
        getEmployeeApi(department: selectDep);
      }
    });
  }
}
