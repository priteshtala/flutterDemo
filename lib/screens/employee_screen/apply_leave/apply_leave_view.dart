import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/common_search.dart';
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
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  minWidth: 300,
                  child: const Text("Add"),
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
                    state.employeeList.isNotEmpty
                        ? CustomSearch(
                            controller: state.searchController,
                            onChanged: (query) {
                              context.read<ApplyLeaveCubit>().notifyEmp(query);
                            },
                            // onTap: ,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.filtterdUserList.length,
                            itemBuilder: (context, index) {
                              var employee = state.filtterdUserList[index];
                              return Card(
                                elevation: 3,
                                shadowColor: Colors.white,
                                color: Colors.white,
                                child: ListTile(
                                  onTap: () {
                                    // context.read<ApplyLeaveCubit>().setSelectedEmployee(employee);
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
                                  trailing: IconButton(
                                    onPressed: () {
                                      // state.searchController.text = state.filtterdUserList[index].name.toString();
                                      context.read<ApplyLeaveCubit>().clearSearch();
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ),
                              );
                            },
                          ),
                    const SizedBox(height: 20),
                    const Text(
                      "Start Date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
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
                                hintText: "Enter Date",
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
                                hintText: "Enter Date",
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
                  top: 70,
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
                        return Card(
                          elevation: 3,
                          shadowColor: Colors.white,
                          color: Colors.white,
                          child: ListTile(
                            onTap: () {
                              state.searchController.text = state.filtterdUserList[index].name.toString();

                              context.read<ApplyLeaveCubit>().setSelectedEmployee(employee);
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
