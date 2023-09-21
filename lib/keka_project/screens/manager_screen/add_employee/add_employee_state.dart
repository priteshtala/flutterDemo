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
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController mobileController;
  TextEditingController dateController;
  List<Department> departmentList;
  String? selectedValue;
  bool iconShowHide;

  AddEmployeeState({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.mobileController,
    required this.dateController,
    this.departmentList = const [],
    this.selectedValue,
    this.iconShowHide = false,
  });

  AddEmployeeState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? mobileController,
    TextEditingController? dateController,
    List<Department>? departmentList,
    String? selectedValue,
    bool? iconShowHide,
  }) {
    return AddEmployeeState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      mobileController: mobileController ?? this.mobileController,
      dateController: dateController ?? this.dateController,
      departmentList: departmentList ?? this.departmentList,
      selectedValue: selectedValue ?? this.selectedValue,
      iconShowHide: iconShowHide ?? this.iconShowHide,
    );
  }
}
