import 'package:flutter/material.dart';

abstract base class BaseValidator<T extends Object?> {
  const BaseValidator(this.context);

  final BuildContext context;

  String? call(T? value) => validate(value);

  String? validate(T? value);
}

String password = "";
String comPassword = "";

final class EmailValidator extends BaseValidator<String> {
  const EmailValidator(super.context);

  @override
  String? validate(String? value) {
    if (value!.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Enter a valid email!';
    }
    return null;
  }
}

final class PassWord extends BaseValidator<String> {
  const PassWord(super.context);

  @override
  String? validate(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }
}

final class FirstName extends BaseValidator<String> {
  const FirstName(super.context);

  @override
  String? validate(String? value) {
    if (value!.isEmpty) {
      return 'please fill First Name';
    } else {
      return null;
    }
  }
}

final class LastName extends BaseValidator<String> {
  const LastName(super.context);

  @override
  String? validate(String? value) {
    if (value!.isEmpty) {
      return 'please fill Last Name';
    } else {
      return null;
    }
  }
}

final class emptyName extends BaseValidator<String> {
  const emptyName(super.context);

  @override
  String? validate(String? value) {
    if (value!.isEmpty) {
      return 'please Enter Field';
    } else {
      return null;
    }
  }
}
// final class conPassWord extends BaseValidator<String> {
//   const conPassWord(super.context);
//
//   @override
//   String? validate(String? value) {
//     if (value!.isEmpty) {
//       return "Enter Your Conform Password";
//     } else {
//       if (password != conpassword) {
//         return "Conform Password Not Matched";
//       }
//     }
//   }
