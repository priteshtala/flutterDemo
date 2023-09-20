// import 'package:finaldemo/keka_project/common/common_button.dart';
// import 'package:finaldemo/keka_project/common/common_textformfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'employee_login_cubit.dart';
// import 'employee_login_state.dart';
//
// class EmployeeLoginView extends StatefulWidget {
//   static const String routeName = "/Employee_Login_View";
//
//   static Widget builder(BuildContext context) {
//     return BlocProvider(
//       create: (context) => EmployeeLoginCubit(
//         EmployeeLoginState(
//           emailController: TextEditingController(),
//           passwordController: TextEditingController(),
//         ),
//       ),
//       child: const EmployeeLoginView(),
//     );
//   }
//
//   const EmployeeLoginView({super.key});
//
//   @override
//   State<EmployeeLoginView> createState() => _EmployeeLoginViewState();
// }
//
// class _EmployeeLoginViewState extends State<EmployeeLoginView> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<EmployeeLoginCubit, EmployeeLoginState>(
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               "Log-In",
//             ),
//           ),
//           backgroundColor: Colors.white,
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Center(
//                   child: Image.network(
//                     "https://img.freepik.com/free-photo/computer-security-with-login-password-padlock_107791-16191.jpg?w=996&t=st=1693455723~exp=1693456323~hmac=de3c3a646fb74dcbfc30389aa6b92728347549967de2a757592a0f07815fd607",
//                     height: MediaQuery.of(context).size.height * 0.35,
//                     fit: BoxFit.fill,
//                     width: MediaQuery.of(context).size.width * 0.80,
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     CustomTextForm(
//                       controller: state.emailController,
//                       readOnly: false,
//                       textCapitalization: TextCapitalization.none,
//                       obscureText: false,
//                       hintText: "Enter Your Email",
//                       keyboardType: TextInputType.emailAddress,
//                       prefixIcon: const Icon(Icons.email),
//                     ),
//                     CustomTextForm(
//                       controller: state.passwordController,
//                       readOnly: false,
//                       textCapitalization: TextCapitalization.none,
//                       obscureText: state.iconShowHide,
//                       hintText: "Enter Your Password",
//                       prefixIcon: const Icon(Icons.lock),
//                       suffixIcon: IconButton(
//                         onPressed: () => context.read<EmployeeLoginCubit>().visibility(),
//                         icon:
//                             state.iconShowHide ? const Icon(Icons.visibility_off_sharp) : const Icon(Icons.visibility),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           bottomNavigationBar: SafeArea(
//             minimum: const EdgeInsets.only(bottom: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomButton(
//                   onPressed: () {
//                     context.read<EmployeeLoginCubit>().validation(context);
//                   },
//                   minWidth: 300,
//                   child: const Text(
//                     "Log-in",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

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
                    Image.network("https://knowledgemission.kerala.gov.in/img/login.jpg", height: 250),
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
                    const Text(
                      "------------------------------ or ------------------------------",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network("https://cdn-icons-png.flaticon.com/512/2504/2504739.png", width: 35),
                        Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png",
                            width: 35),
                        Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/292px-Logo_of_Twitter.svg.png",
                            width: 35),
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
