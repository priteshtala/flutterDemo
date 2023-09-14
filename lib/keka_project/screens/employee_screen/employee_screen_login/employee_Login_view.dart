import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/common_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'employee_login_cubit.dart';
import 'employee_login_state.dart';

class EmployeeLoginView extends StatefulWidget {
  static const String routeName = "/Employee_Login_View";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeLoginCubit(EmployeeLoginState()),
      child: const EmployeeLoginView(),
    );
  }

  const EmployeeLoginView({super.key});

  @override
  State<EmployeeLoginView> createState() => _EmployeeLoginViewState();
}

class _EmployeeLoginViewState extends State<EmployeeLoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeLoginCubit, EmployeeLoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Log-In",
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    "https://img.freepik.com/free-photo/computer-security-with-login-password-padlock_107791-16191.jpg?w=996&t=st=1693455723~exp=1693456323~hmac=de3c3a646fb74dcbfc30389aa6b92728347549967de2a757592a0f07815fd607",
                    height: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width * 0.80,
                  ),
                ),
                Column(
                  children: [
                    CustomTextForm(
                      controller: state.emailController,
                      readOnly: false,
                      textCapitalization: TextCapitalization.none,
                      obscureText: false,
                      hintText: "Enter Your Email",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email),
                    ),
                    CustomTextForm(
                      controller: state.passwordController,
                      readOnly: false,
                      textCapitalization: TextCapitalization.none,
                      obscureText: state.iconShowHide,
                      hintText: "Enter Your Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () => context.read<EmployeeLoginCubit>().visibility(),
                        icon:
                            state.iconShowHide ? const Icon(Icons.visibility_off_sharp) : const Icon(Icons.visibility),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {},
                  minWidth: 300,
                  child: const Text(
                    "Log-in",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}