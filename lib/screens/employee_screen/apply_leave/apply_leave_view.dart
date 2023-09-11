import 'package:finaldemo/keka_project/comman/comman_button.dart';
import 'package:finaldemo/keka_project/comman/common_search.dart';
import 'package:finaldemo/screens/employee_screen/apply_leave/apply_leave_cubit.dart';
import 'package:finaldemo/screens/employee_screen/apply_leave/apply_leave_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplyLeaveView extends StatefulWidget {
  static const String routeName = '/Apply_Leave_View';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplyLeaveCubit(),
      child: const ApplyLeaveView(),
    );
  }

  const ApplyLeaveView({super.key});

  @override
  State<ApplyLeaveView> createState() => _ApplyLeaveViewState();
}

class _ApplyLeaveViewState extends State<ApplyLeaveView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyLeaveCubit, ApplyLeaveState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              minWidth: 300,
              child: Text("Add"),
              onPressed: () {},
            ),
          ),
          appBar: AppBar(
            title: const Text("Leave"),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                CustomSearch(
                  onTap: () {
                    // context.read<ApplyLeaveCubit>().
                  },
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Start Date"),
                      Container(
                        padding: EdgeInsets.all(8),
                        // width: 200,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: state.dateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            icon: Icon(Icons.calendar_today, color: Colors.green),
                          ),
                          // readOnly: true,
                          onTap: () {
                            context.read<ApplyLeaveCubit>().dateTimePicker(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("End Date"),
                      Container(
                        padding: EdgeInsets.all(8),
                        // width: 200,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: state.dateTimeController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            icon: Icon(Icons.calendar_today, color: Colors.green),
                          ),
                          // readOnly: true,
                          onTap: () {
                            context.read<ApplyLeaveCubit>().dateTimePicker(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Reason"),
                      Container(
                        padding: EdgeInsets.all(8),
                        // width: 200,
                        alignment: Alignment.center,
                        child: TextField(
                          maxLines: 5,
                          controller: state.reasonController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          // readOnly: true,
                          onTap: () {
                            // context.read<ApplyLeaveCubit>().dateTimePicker(context);
                          },
                        ),
                      ),
                    ],
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
