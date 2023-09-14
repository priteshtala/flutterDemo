import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/common_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'employee_login_cubit.dart';
import 'employee_login_state.dart';

class CircularParticleScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CircularParticle(
        width: w,
        height: h,
        particleColor: Colors.white.withOpacity(.6),
        numberOfParticles: 150,
        speedOfParticles: 1.5,
        maxParticleSize: 7,
        awayRadius: 0,
        onTapAnimation: false,
        isRandSize: true,
        isRandomColor: false,
        connectDots: false,
        enableHover: false,
      ),
    );
  }
}

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
        double h = MediaQuery.of(context).size.height;
        double w = MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: Colors.green.shade300,

          appBar: AppBar(
            title: const Text(
              "Log-In",
              textScaleFactor: 1.5,
            ),
          ),
          // backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [


                Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            icon: state.iconShowHide
                                ? const Icon(Icons.visibility_off_sharp)
                                : const Icon(Icons.visibility),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                    textScaleFactor: 1.5,
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