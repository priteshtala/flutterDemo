import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'manager_leave_cubit.dart';
import 'manager_leave_state.dart';

class ManagerLeaveView extends StatefulWidget {
  static const String routeName = '/Employee_Screen_View';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagerScreenCubit(),
      child: const ManagerLeaveView(),
    );
  }

  const ManagerLeaveView({super.key});

  @override
  State<ManagerLeaveView> createState() => _ManagerLeaveViewState();
}

class _ManagerLeaveViewState extends State<ManagerLeaveView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagerScreenCubit, ManagerScreenState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonChange(
                  color: Colors.green,
                  child: const Text("Add Leave",style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () {
                    context.read<ManagerScreenCubit>().navigateToApplyLeave(context);
                  }, width: 150, height: 40,
                ),
                CustomButtonChange(
                  color: Colors.green,

                  onPressed: () {
                    context.read<ManagerScreenCubit>().navigateToManagerRequest(context);
                  },
                  width: 150,
                  height: 40,
                  child: const Text("Leave Requests",style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Elaunch Solution"),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<ManagerScreenCubit>().alert(context);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "On Leave Today",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.leaveList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.primaries[index],
                                    child: Text(
                                      "${state.leaveList[index].name[0]}${state.leaveList[index].surname[0]}",
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    const SizedBox(height: 5),
                                    Text("${state.leaveList[index].name}..", overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Leave",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: TextField(
                                controller: state.dateController,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.calendar_today, color: Colors.deepPurple),
                                ),
                                readOnly: true,
                                onTap: () {
                                  context.read<ManagerScreenCubit>().dateTime(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.leaveList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Colors.primaries[index],
                                      child: Text(
                                          "${state.leaveList[index].name[0]}${state.leaveList[index].surname[0]}",
                                          style: const TextStyle(color: Colors.white))),
                                ),
                                Column(
                                  children: [
                                    const SizedBox(height: 5),
                                    Text(
                                      "${state.leaveList[index].name}..",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 10),
                // Container(
                //   decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(16),
                //         child: const Text(
                //           "Today Birthday",
                //           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                //         ),
                //       ),
                //       Container(
                //         padding: const EdgeInsets.only(top: 10, bottom: 10),
                //         height: 120,
                //         child: ListView.builder(
                //           scrollDirection: Axis.horizontal,
                //           itemCount: state.leaveList.length,
                //           shrinkWrap: true,
                //           itemBuilder: (context, index) {
                //             return Column(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.symmetric(horizontal: 16),
                //                   child: CircleAvatar(
                //                       radius: 27,
                //                       backgroundColor: Colors.primaries[index],
                //                       child: Text(
                //                           "${state.leaveList[index].name[0]}${state.leaveList[index].surname[0]}",
                //                           style: const TextStyle(color: Colors.white))),
                //                 ),
                //                 Column(
                //                   children: [
                //                     const SizedBox(height: 5),
                //                     Text(
                //                       "${state.leaveList[index].name}..",
                //                       overflow: TextOverflow.ellipsis,
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             );
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<ManagerScreenCubit>().navigateToEmployeeView(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade200,
                          ),
                          height: 150,
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Employee",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "${state.leaveList.length}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<ManagerScreenCubit>().navigateToDepartmentView(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade200,
                          ),
                          height: 150,
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Department",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "${state.leaveList.length}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
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
