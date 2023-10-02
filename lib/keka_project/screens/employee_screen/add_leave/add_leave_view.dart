import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/common_search.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/shardpref.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'add_leave_cubit.dart';
import 'add_leave_state.dart';

class AddLeaveView extends StatefulWidget {
  static const String routeName = '/Apply_Leave_View';

  static Widget builder(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Profile?;
    return BlocProvider(
      create: (context) => AddLeaveCubit(
        context,
        AddLeaveState(
            dateController: TextEditingController(),
            dateTimeController: TextEditingController(),
            reasonController: TextEditingController(),
            searchController: TextEditingController(),
            profile: args),
      ),
      child: const AddLeaveView(),
    );
  }

  const AddLeaveView({super.key});

  @override
  State<AddLeaveView> createState() => _AddLeaveViewState();
}

class _AddLeaveViewState extends State<AddLeaveView> {
  @override
  void initState() {
    super.initState();
    context.read<AddLeaveCubit>().getNotifyEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddLeaveCubit, AddLeaveState>(
      builder: (context, state) {
        print("=============${Profile.employee.index}============${Profile.manager.index}");
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    // if (state.dateController.text.isEmpty ||
                    //     state.dateTimeController.text.isEmpty ||
                    //     state.reasonController.text.isEmpty) {
                    //   context.read<AddLeaveCubit>().validation(context);
                    // } else {
                    // var token = await Helper().getToken();
                    (state.profile == Profile.manager)
                        // token.isNotEmpty
                        ? context.read<AddLeaveCubit>().postAddLeave(
                            0.toString(),
                            state.dateController.text,
                            state.dateTimeController.text,
                            state.reasonController.text,
                            state.filtterdUserList.map((e) => e.id).firstOrNull)
                        : context.read<AddLeaveCubit>().postAddLeave(
                            1.toString(),
                            state.dateController.text,
                            state.dateTimeController.text,
                            state.reasonController.text,
                            state.filtterdUserList.map((e) => e.id).firstOrNull);
                    print("manager=================== ${state.profile == Profile.manager}");
                    print("id:::::::::${state.filtterdUserList.map((e) => e.id).firstOrNull}");

                    context.read<AddLeaveCubit>().navigateToManagerLeave(context);
                    // }
                  },
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
                              context.read<AddLeaveCubit>().notifyEmp(query);
                            },
                          )
                        : Chip(
                            backgroundColor: Colors.green.shade100,
                            deleteButtonTooltipMessage: "Remove",
                            onDeleted: () {
                              context.read<AddLeaveCubit>().clearSearch();
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
                    const Gap(20),
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
                                context.read<AddLeaveCubit>().dateTimePicker(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
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
                                context.read<AddLeaveCubit>().datePicker(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
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
                              context.read<AddLeaveCubit>().notifyEmployee(employee);
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
