import 'package:finaldemo/keka_project/comman/common_search.dart';
import 'package:finaldemo/screens/manager_screen/employee_details/employee_details_cubit.dart';
import 'package:finaldemo/screens/manager_screen/employee_details/employee_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeDetailsView extends StatefulWidget {
  static const String routeName = "/Employee_details_view";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeDetailsCubit(EmployeeDetailsState()),
      child: const EmployeeDetailsView(),
    );
  }

  const EmployeeDetailsView({super.key});

  @override
  State<EmployeeDetailsView> createState() => _EmployeeDetailsViewState();
}

class _EmployeeDetailsViewState extends State<EmployeeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee-Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSearch(),
            SizedBox(height: 5),
            Divider(color: Colors.black),
            Row(
              children: [
                Text("Department"),
                // DropdownButton(items: items, onChanged: onChanged)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
