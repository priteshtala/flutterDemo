// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:flutter/material.dart';

class AddEmployeeState extends Equatable {
  @override
  List<Object?> get props => [
        nameController,
        emailController,
        passwordController,
        mobileController,
        dateController,
        departmentList,
        selectedValue,
        iconShowHide,
        roleController,
      ];
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController roleController;
  TextEditingController mobileController;
  TextEditingController dateController;
  TextEditingController locationController;
  List<Department> departmentList;
  Department? selectedValue;
  bool iconShowHide;
  // dynamic token;

  AddEmployeeState(
      {required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.roleController,
      required this.mobileController,
      required this.dateController,
      required this.locationController,
      this.departmentList = const [],
      this.selectedValue,
      this.iconShowHide = false,
      // required this.token
      });

  AddEmployeeState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? roleController,
    TextEditingController? mobileController,
    TextEditingController? dateController,
    TextEditingController? locationController,
    List<Department>? departmentList,
    Department? selectedValue,
    bool? iconShowHide,
    // dynamic token,
  }) {
    return AddEmployeeState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      roleController: roleController ?? this.roleController,
      mobileController: mobileController ?? this.mobileController,
      dateController: dateController ?? this.dateController,
      locationController: locationController ?? this.locationController,
      departmentList: departmentList ?? this.departmentList,
      selectedValue: selectedValue ?? this.selectedValue,
      iconShowHide: iconShowHide ?? this.iconShowHide,
      // token: token ?? this.token,
    );
  }
}
