// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class EmployeeLoginState extends Equatable {
  @override
  List<Object?> get props => [emailController, passwordController, iconShowHide, formKey, iconShowHide];

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool iconShowHide;
  var error;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EmployeeLoginState({
    required this.emailController,
    required this.passwordController,
    this.iconShowHide = true,
    required this.formKey,
    this.error,
  });

  EmployeeLoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? iconShowHide,
    GlobalKey<FormState>? formKey,
    var error,
  }) {
    return EmployeeLoginState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      iconShowHide: iconShowHide ?? this.iconShowHide,
      formKey: formKey ?? this.formKey,
      error: error ?? this.error,
    );
  }
}
