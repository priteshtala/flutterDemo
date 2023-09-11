import 'package:finaldemo/screens/manager_screen/department_details/department_details_cubit.dart';
import 'package:finaldemo/screens/manager_screen/department_details/department_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentDetailsView extends StatefulWidget {
  static const String routeName = "/Department_Details_View";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentDetailsCubit(),
      child: const DepartmentDetailsView(),
    );
  }

  const DepartmentDetailsView({super.key});

  @override
  State<DepartmentDetailsView> createState() => _DepartmentDetailsViewState();
}

class _DepartmentDetailsViewState extends State<DepartmentDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentDetailsCubit, DepartmentDetailsState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: MaterialButton(
            child: Text("Add Department"),
            onPressed: () {},
          ),
          appBar: AppBar(
            title: const Text("Department"),
          ),
          body: ListView.builder(
            itemCount: state.departmentList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Text(state.departmentList[index].department),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
