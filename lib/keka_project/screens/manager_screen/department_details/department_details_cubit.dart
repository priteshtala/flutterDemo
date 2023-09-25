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
                  splashColor: Colors.blue,
                  shape: Border.all(color: Colors.black),
                  onPressed: () {
                    // staticListAdd();
                    Navigator.pop(context);

                    print("Add::${state.departmentList}");
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                MaterialButton(
                  shape: Border.all(color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("No"),
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
    // sort();
    emit(state.copyWith(leaveSearchList: leaveList));
  }

  void getDepartmentApi() async {
    final response = await Dio().get("https://5479-136-232-118-126.ngrok-free.app/api/department");
    var animalList = List<Department>.from(state.departmentList);
    if (response.statusCode == 200) {
      var data = response.data;
      // print("object=d=a=======${data}");
      for (var entry in data) {
        animalList.add(Department.fromJson(entry));
      }
    } else {
      Text("No-Data");
    }
    emit(state.copyWith(departmentList:  animalList,leaveSearchList: animalList));
    // print("object======,ojoipo,lpokokpopokoijikpo0popopokpokpokoioi${state.departmentList}");
  }
  // void sort() {
  //   List<Department> leaveList = List<Department>.from(state.departmentList);
  //   leaveList.sort(
  //     (a, b) => a.department.compareTo(b.department),
  //   );
  //   // staticListAdd();
  //   emit(state.copyWith(departmentList: leaveList, leaveSearchList: leaveList));
  // }

  // void staticListAdd() {
  //   List<Department> leaveList = List<Department>.from(state.departmentList);
  //   leaveList.add(
  //     Department(department: state.departmentController.text),
  //   );
  //   emit(
  //     state.copyWith(
  //         departmentList: leaveList,
  //         leaveSearchList: leaveList,
  //         departmentController: state.departmentController,
  //         staticList: leaveList),
  //   );
  //   print("Add::${state.staticList}");
  //   print("text::${state.departmentController.text}");
  // }
}
