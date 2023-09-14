import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/employee_Login_view.dart';
import 'package:finaldemo/keka_project/screens/main_screen/main_screen_cubit.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave/manager_leave_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_screen_state.dart';

class MainScreenView extends StatefulWidget {
  static const String routeName = "/Main_Screen_View";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(
        MainScreenState(),
      ),
      child: const MainScreenView(),
    );
  }

  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text("Keka"),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () {
                      if (state.isSelected == -1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 1),
                            padding: EdgeInsets.all(3),
                            backgroundColor: Colors.red,
                            content: Text(
                              "Select Type",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              textScaleFactor: 1.3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else if (state.isSelected == 0) {
                        Navigator.of(context).pushNamed(ManagerLeaveView.routeName);
                      } else {
                        Navigator.of(context).pushNamed(EmployeeLoginView.routeName);
                      }
                    },
                    minWidth: 300,
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    // minWidth: 300,
                  )
                ],
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<MainScreenCubit>().isSelectedColor(0);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: state.isSelected == 0 ? Colors.green.shade300 : Colors.grey.shade300,
                      ),
                      height: state.isSelected == 0 ? 220 : 200,
                      width: state.isSelected == 0 ? 220 : 200,
                      child: Center(
                        child: Text(
                          "Manager",
                          textScaleFactor: 2,
                          style: TextStyle(color: state.isSelected == 0 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  InkWell(
                    onTap: () {
                      context.read<MainScreenCubit>().isSelectedColor(1);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: state.isSelected == 1 ? Colors.green.shade300 : Colors.grey.shade300,
                      ),
                      height: state.isSelected == 1 ? 220 : 200,
                      width: state.isSelected == 1 ? 220 : 200,
                      child: Center(
                        child: Text(
                          "Employee",
                          textScaleFactor: 2,
                          style: TextStyle(color: state.isSelected == 1 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
