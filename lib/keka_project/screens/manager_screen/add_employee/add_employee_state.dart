// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:finaldemo/keka_project/model/login_details/login_details.dart';
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
        loginData,
        profile,
        filtterdUserList,
        employeeList,
        formKey,
      ];
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController roleController;
  TextEditingController mobileController;
  TextEditingController dateController;
  TextEditingController locationController;
  List<Department> departmentList;
  List<Employee> filtterdUserList;
  List<Employee> employeeList;
  Department? selectedValue;
  bool iconShowHide;
  EmployeeLoginDetails? loginData;
  Profile? profile;
  bool isValidation;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // dynamic token;

  AddEmployeeState({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.roleController,
    required this.mobileController,
    required this.dateController,
    required this.locationController,
    this.departmentList = const [],
    this.filtterdUserList = const [],
    this.employeeList = const [],
    this.selectedValue,
    this.iconShowHide = false,
    this.loginData,
    this.profile,
    required this.formKey,
    this.isValidation = false,
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
    List<Employee>? filtterdUserList,
    List<Employee>? employeeList,
    Department? selectedValue,
    bool? iconShowHide,
    EmployeeLoginDetails? loginData,
    Profile? profile,
    GlobalKey<FormState>? formKey,
    bool? isValidation,

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
      filtterdUserList: filtterdUserList ?? this.filtterdUserList,
      employeeList: employeeList ?? this.employeeList,
      selectedValue: selectedValue ?? this.selectedValue,
      iconShowHide: iconShowHide ?? this.iconShowHide,
      loginData: loginData ?? this.loginData,
      profile: profile ?? this.profile,
      formKey: formKey ?? this.formKey,
      isValidation: isValidation ?? this.isValidation,
      // token: token ?? this.token,
    );
  }
}
