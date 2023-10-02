import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:flutter/material.dart';
import 'department_details_state.dart';

class DepartmentDetailsCubit extends Cubit<DepartmentDetailsState> {
  DepartmentDetailsCubit()
      : super(
          DepartmentDetailsState(
            departmentController: TextEditingController(),
            // leaveSearchList: leaveEmpList,
            // departmentList: leaveEmpList,
            // staticList: leaveEmpList,
          ),
        );

  void addDepartment(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          actionsPadding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          title: const Text("Add Department"),
          actions: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter Department"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(

                  shape: Border.all(color: Colors.black),
                  onPressed: () {
                    // staticListAdd();
                    Navigator.pop(context);
                    // state.leaveSearchList.add(Department(name: state.departmentController.text, createAt: "", updateAt: ""));
                    print("Add::${state.staticList}");
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                MaterialButton(splashColor: Colors.red,

                  shape: Border.all(color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "No",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void departmentSearch(query) {
    List<Department> leaveList = List<Department>.from(state.departmentList);
    leaveList = leaveList.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    emit(state.copyWith(leaveSearchList: leaveList));
  }

  void getDepartmentApi() async {
    final response = await Dio().get("https://19d1-136-232-118-126.ngrok-free.app/api/department");
    var animalList = List<Department>.from(state.departmentList);
    if (response.statusCode == 200) {
      var data = response.data;
      for (var entry in data) {
        animalList.add(Department.fromJson(entry));
        animalList.sort(
          (a, b) => a.name.compareTo(b.name),
        );
      }
    } else {
      Text("No-Data");
    }
    emit(state.copyWith(departmentList: animalList, leaveSearchList: animalList));
  }
}
