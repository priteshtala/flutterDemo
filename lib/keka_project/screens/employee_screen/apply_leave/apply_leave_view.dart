import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/common_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'apply_leave_cubit.dart';
import 'apply_leave_state.dart';

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
          backgroundColor: Colors.white,
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  minWidth: 300,
                  child: const Text("Add", style: TextStyle(color: Colors.white, fontSize: 18),),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text("Leave"),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Notify Employee",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Gap(6),
                    state.notifyEmployee.isEmpty
                        ? CustomSearch(
                            controller: state.searchController,
                            onChanged: (query) {
                              context.read<ApplyLeaveCubit>().notifyEmp(query);
                            },
                          )
                        // : Container(
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.black),
                        //       gradient: LinearGradient(
                        //           colors: [Colors.green.shade400, Colors.grey.shade200],
                        //           begin: Alignment.topRight,
                        //           end: Alignment.bottomRight),
                        //       color: Colors.white,
                        //     ),
                        //     child: ListTile(
                        //       title: Text(state.notifyEmployee.first.name,
                        //           style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        //           textScaleFactor: 1),
                        //       subtitle: Text(state.notifyEmployee.first.role),
                        //       leading: CircleAvatar(
                        //         radius: 30,
                        //         backgroundColor: Colors.white,
                        //         child: Text(
                        //           style: const TextStyle(color: Colors.black),
                        //           state.notifyEmployee.first.name.split("").first,
                        //         ),
                        //       ),
                        //       trailing: IconButton(
                        //         onPressed: () {
                        //           context.read<ApplyLeaveCubit>().clearSearch();
                        //         },
                        //         icon: const Icon(Icons.close),
                        //       ),
                        //     ),
                        //   ),
                        : Chip(
                            backgroundColor: Colors.green.shade100,
                            deleteButtonTooltipMessage: "Remove",
                            onDeleted: () {
                              context.read<ApplyLeaveCubit>().clearSearch();
                            },
                            avatar: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.green,
                              child: Text(
                                style: const TextStyle(color: Colors.white),
                                state.notifyEmployee.first.name.split("").first,
                              ),
                            ),
                            label: Text(
                              state.notifyEmployee.first.name,
                            ),
                          ),
                    const SizedBox(height: 20),
                    const Text(
                      "Start Date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Gap(6),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: 70,
                            alignment: Alignment.center,
                            child: TextFormField(
                              onChanged: (value) {},
                              controller: state.dateController,
                              decoration: const InputDecoration(
                                hintText: "Select Date",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: Colors.green, width: 2),
                                ),
                                icon: Icon(Icons.calendar_today, color: Colors.green),
                              ),
                              onTap: () {
                                context.read<ApplyLeaveCubit>().dateTimePicker(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "End Date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Gap(6),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: TextFormField(
                              cursorColor: Colors.green,
                              controller: state.dateTimeController,
                              decoration: const InputDecoration(
                                hintText: "Select Date",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: Colors.green, width: 2),
                                ),
                                icon: Icon(Icons.calendar_today, color: Colors.green),
                              ),
                              onTap: () {
                                context.read<ApplyLeaveCubit>().datePicker(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Reason",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Gap(6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          maxLines: 5,
                          controller: state.reasonController,
                          decoration: const InputDecoration(
                            hintText: "Enter Valid Reason..",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(color: Colors.green, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 75,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Visibility(
                    visible: state.searchController.text.length > 2 ? true : false,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.filtterdUserList.length,
                      itemBuilder: (context, index) {
                        var employee = state.filtterdUserList[index];
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2), blurRadius: 2, offset: const Offset(-2, 4)),
                            ],
                            color: Colors.white,
                          ),
                          child: ListTile(
                            tileColor: Colors.grey,
                            onTap: () {
                              context.read<ApplyLeaveCubit>().notifyEmployee(employee);
                            },
                            title: Text(employee.name,
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                textScaleFactor: 1),
                            subtitle: Text(employee.role),
                            leading: CircleAvatar(
                              backgroundColor: Colors.primaries[index],
                              child: Text(
                                style: const TextStyle(color: Colors.white),
                                state.filtterdUserList[index].name[0],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
