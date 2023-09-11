import 'package:finaldemo/keka_project/comman/comman_button.dart';

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
                  color: Colors.green.shade300,
                  minWidth: 150,
                  child: const Text("Add Leave"),
                  onPressed: () {},
                ),
                CustomButtonChange(
                  color: Colors.green.shade300,
                  minWidth: 150,
                  onPressed: () {},
                  child: const Text("Request Leaves"),
                ),
              ],
            ),
          ),
          appBar: AppBar(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("On Leave Today", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.empList.length,
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
                                "${state.empList[index].name[0]}${state.empList[index].surname[0]}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text("${state.empList[index].name}..", overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Leave",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      CustomButtonChange(
                        textColor: Colors.white,
                        color: Colors.deepPurple,
                        minWidth: 100,
                        child: const Text("Select Date"),
                        onPressed: () {
                          context.read<ManagerScreenCubit>().dateTime(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // padding: EdgeInsets.only(top: 15),
                    itemCount: state.empList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CircleAvatar(
                                radius: 27,
                                backgroundColor: Colors.primaries[index],
                                child: Text("${state.empList[index].name[0]}${state.empList[index].surname[0]}",
                                    style: TextStyle(color: Colors.white))),
                          ),
                          Column(
                            children: [
                              Text(
                                "${state.empList[index].name}..",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
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
                              "${state.empList.length}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                              "${state.empList.length}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
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
