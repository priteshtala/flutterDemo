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
      create: (context) => EmployeeLoginCubit(
        EmployeeLoginState(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          formKey: GlobalKey(),
        ),
      ),
      child: const EmployeeLoginView(),
    );
  }

  const EmployeeLoginView({Key? key}) : super(key: key);

  @override
  EmployeeLoginViewState createState() => EmployeeLoginViewState();
}

class EmployeeLoginViewState extends State<EmployeeLoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        title: const Text('Log-In'),
      ),
      body: BlocBuilder<EmployeeLoginCubit, EmployeeLoginState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: state.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Login to your account",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    Image.asset("assets/images/login.jpg", height: 250),
                    const SizedBox(height: 20),
                    CustomTextForm(
                      validator: (p0) {
                        if (state.passwordController.text.isEmpty) {
                          return "Enter Email Please";
                        }
                        return null;
                      },
                      controller: state.emailController,
                      readOnly: false,
                      textCapitalization: TextCapitalization.none,
                      obscureText: false,
                      hintText: "Enter Your Email",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextForm(
                      validator: (p0) {
                        if (state.passwordController.text.isEmpty) {
                          return "Enter Password Please";
                        }
                        return null;
                      },
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
                    const SizedBox(
                      height: 70,
                    ),
                    CustomButtonChange(
                      onPressed: () {
                        state.formKey.currentState?.validate();
                      },
                      width: 300,
                      height: 40,
                      color: Colors.green,
                      child: Text("Login", style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: Divider(thickness: 1, indent: 40, endIndent: 10)),
                        Text("or"),
                        Expanded(child: Divider(thickness: 1, indent: 10, endIndent: 40)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/google.png", width: 35),
                        Image.asset("assets/images/facebook.png.webp", width: 35),
                        Image.asset("assets/images/twitter.png", width: 35),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
