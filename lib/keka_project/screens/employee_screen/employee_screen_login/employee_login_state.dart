import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class EmployeeLoginState extends Equatable {
  @override
  List<Object?> get props => [emailController, passwordController, iconShowHide];

  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final bool iconShowHide;

  EmployeeLoginState({this.emailController, this.passwordController, this.iconShowHide = false});

  EmployeeLoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? iconShowHide,
  }) {
    return EmployeeLoginState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      iconShowHide: iconShowHide ?? this.iconShowHide,
    );
  }
}
