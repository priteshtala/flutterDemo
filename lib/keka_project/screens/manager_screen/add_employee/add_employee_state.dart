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
      ];
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController nameController;
  TextEditingController mobileController;
  TextEditingController dateController;
  bool iconShowHide;
  List<Department> departmentList;
  String? selectedValue;

  AddEmployeeState({
    required this.emailController,
    required this.passwordController,
    this.iconShowHide = false,
    required this.nameController,
    required this.mobileController,
    required this.dateController,
    this.departmentList = const [],
    this.selectedValue,
  });

  AddEmployeeState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? nameController,
    TextEditingController? mobileController,
    TextEditingController? dateController,
    bool? iconShowHide,
    List<Department>? departmentList,
    String? selectedValue,
  }) {
    return AddEmployeeState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      iconShowHide: iconShowHide ?? this.iconShowHide,
      nameController: nameController ?? this.nameController,
      mobileController: mobileController ?? this.mobileController,
      dateController: dateController ?? this.dateController,
      departmentList: departmentList ?? this.departmentList,
      selectedValue: selectedValue ?? this.selectedValue,
    );
  }
}
