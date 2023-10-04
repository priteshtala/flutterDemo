import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/common_search.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
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
      create: (context) => EmployeeDetailsCubit(
        context,
        EmployeeDetailsState(
          searchController: TextEditingController(),
        ),
      ),
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
    context.read<EmployeeDetailsCubit>().getEmployeeApi();
    context.read<EmployeeDetailsCubit>().getDepartmentApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as Profile?;

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
                    context.read<EmployeeDetailsCubit>().runFilter(query);
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
                            ),
                          ),
                          child: DropdownButtonFormField<Department>(
                            alignment: Alignment.center,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            isDense: true,
                            hint: const Text('All'),
                            value: state.selectedValue,
                            onChanged: (value) {
                              context.read<EmployeeDetailsCubit>().dropdownSelected(value!);
                            },
                            items: state.departmentList
                                .map(
                                  (user) => DropdownMenuItem<Department>(
                                    value: user,
                                    child: Text(user.name.toString()),
                                  ),
                                )
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
                                employee.name.toString(),
                                style:
                                    const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              const Gap(8),
                              Text(employee.role.toString()),
                              const Gap(8),
                              Text("Location : ${employee.location}"),
                              Text("Department : ${employee.department.name}"),
                              Text("Email : ${employee.email}"),
                              Text("Mobile : ${employee.mobileNo}"),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ] else if (state.employeeList.isEmpty) ...[
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ),
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
                    context.read<EmployeeDetailsCubit>().addEmployee(arg);
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
