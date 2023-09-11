import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AddEmployeeState extends Equatable{
  @override
  List<Object?> get props => [emailController,passwordController,iconShowHide];
  TextEditingController? emailController;
  TextEditingController? passwordController;
  bool iconShowHide;

  AddEmployeeState({this.emailController, this.passwordController, this.iconShowHide = false});

  AddEmployeeState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? iconShowHide,
  }) {
    return AddEmployeeState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      iconShowHide: iconShowHide ?? this.iconShowHide,
    );
  }
}