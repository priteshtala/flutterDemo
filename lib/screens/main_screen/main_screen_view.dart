import 'package:finaldemo/keka_project/comman/common_button.dart';
import 'package:finaldemo/screens/employee_screen/employee_screen_login/employee_Login_view.dart';
import 'package:finaldemo/screens/main_screen/main_screen_cubit.dart';
import 'package:finaldemo/screens/main_screen/main_screen_state.dart';
import 'package:finaldemo/screens/manager_screen/manager_leave/manager_leave_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenView extends StatefulWidget {
  static const String routeName = "/Main_Screen_View";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(
        const MainScreenState(),
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
    // final blocBuilder = context.read<MainScreenCubit>();
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    context.read<MainScreenCubit>().isSelectedColor(0);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: state.isSelected == 0 ? Colors.green.shade300 : Colors.grey.shade300,
                    ),
                    height: 200,
                    width: 200,
                    child: const Center(
                        child: Text(
                      "Manager",
                      textScaleFactor: 2,
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<MainScreenCubit>().isSelectedColor(1);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: state.isSelected == 1 ? Colors.green.shade300 : Colors.grey.shade300,
                    ),
                    height: 200,
                    width: 200,
                    child: const Center(
                        child: Text(
                      "Employee",
                      textScaleFactor: 2,
                    )),
                  ),
                ),
              ],
            ),
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
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                            )));
                      } else if (state.isSelected == 0) {
                        // debugPrint("Done......!");
                        Navigator.of(context).pushNamed(ManagerLeaveView.routeName);
                      } else {
                        Navigator.of(context).pushNamed(EmployeeLoginView.routeName);
                      }
                    },
                    minWidth: 300,
                    child: const Text("Next", textScaleFactor: 1.5),
                    // minWidth: 300,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
