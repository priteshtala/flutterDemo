import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/common_search.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/add_employee/add_employee_view.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/employee_details/employee_details_cubit.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/employee_details/employee_details_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EmployeeDetailsView extends StatefulWidget {
  static const String routeName = "/Employee_details_view";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeDetailsCubit(),
      child: const EmployeeDetailsView(),
    );
  }

  const EmployeeDetailsView({super.key});

  @override
  State<EmployeeDetailsView> createState() => _EmployeeDetailsViewState();
}

class _EmployeeDetailsViewState extends State<EmployeeDetailsView> {
  @override
  void initState() {
    context.read<EmployeeDetailsCubit>().getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeDetailsCubit, EmployeeDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Employee-List"),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                CustomSearch(
                  controller: state.searchController,
                  onChanged: (query) {
                    // context.read<EmployeeDetailsCubit>().runFilter(query);
                  },
                ),
                const Gap(8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0),
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Department",
                          textScaleFactor: 1.5,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              inputDecorationTheme: InputDecorationTheme(
                            isDense: true,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.all(8),
                          )),
                          child: DropdownButtonFormField<String>(
                            alignment: Alignment.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            isDense: true,
                            hint: const Text('All'),
                            value: state.selectedValue,
                            onChanged: (value) {
                              // context.read<EmployeeDetailsCubit>().dropdownSelected(value);
                            },
                            items: state.filterDepartmentList
                                .map((user) => DropdownMenuItem<String>(
                                      value: user.name,
                                      child: Text(user.name.toString()),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(8),
                if (state.filtterdUserList.isNotEmpty) ...[
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.filtterdUserList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var employee = state.filtterdUserList[index];
                      return Card(
                        color: Colors.white,
                        elevation: 3,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.green.shade500,
                            child: Text(
                              state.filtterdUserList[index].name.toString()[0],
                              style: const TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                employee.department.toString(),
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              const Gap(8),
                              Text(employee.name.toString()),
                              const Gap(8),
                              Text("Location : ${employee.birthDate}"),
                              Text("Department : ${employee.mobileNo}"),
                              Text("Email : ${employee.location}"),
                              Text("Mobile : ${employee.email}"),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ] else if (state.employeeList.isEmpty) ...[
                  Center(child: CircularProgressIndicator()),
                ] else ...[
                  Text("Data Not Found"),
                ]
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddEmployeeView.routeName);
                  },
                  minWidth: 300,
                  child: const Text(
                    "Add-Employee",
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
