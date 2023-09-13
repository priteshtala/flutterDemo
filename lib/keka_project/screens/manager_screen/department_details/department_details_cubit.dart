import 'package:bloc/bloc.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:flutter/material.dart';
import 'department_details_state.dart';

class DepartmentDetailsCubit extends Cubit<DepartmentDetailsState> {
  DepartmentDetailsCubit()
      : super(
          DepartmentDetailsState(leaveSearchList: leaveEmpList,
            departmentList: [
              Department(department: "Flutter"),
              Department(department: "Android"),
              Department(department: "Laravel"),
              Department(department: "PHP"),
              Department(department: "NodeJs"),
              Department(department: "IOS"),
              Department(department: "ReactJS"),
            ],
          ),
        );

  addDepartment(BuildContext context) {
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
                  onPressed: () {},
                  child: const Text("Add", style: TextStyle(color: Colors.blue)),
                ),
                MaterialButton(
                  shape: Border.all(color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("No"),
                )
              ],
            )
          ],
        );
      },
    );
  }

  void departmentSearch(String query) {
    List<Department> leaveList = List<Department>.from(state.departmentList);
    leaveList = leaveList.where((element) => element.department.toLowerCase().contains(query.toLowerCase())).toList();
    sort();
    emit(state.copyWith(leaveSearchList: leaveList));
  }

  void sort(){
    List<Department> leaveList = List<Department>.from(state.departmentList);
    leaveList.sort((a, b) => a.department.compareTo(b.department),);
    emit(state.copyWith(departmentList: leaveList,leaveSearchList: leaveList));

  }
}
List<Department> leaveEmpList = [
  Department(department: "Flutter"),
  Department(department: "Android"),
  Department(department: "Laravel"),
  Department(department: "PHP"),
  Department(department: "NodeJs"),
  Department(department: "IOS"),
  Department(department: "ReactJS"),
];