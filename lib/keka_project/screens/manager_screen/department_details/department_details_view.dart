import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/common_search.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/department_details/department_details_cubit.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/department_details/department_details_state.dart';

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
  void initState() {
    context.read<DepartmentDetailsCubit>().sort();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentDetailsCubit, DepartmentDetailsState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10),
            child: CustomButtonChange(
              color: Colors.green,
              onPressed: () {
                context.read<DepartmentDetailsCubit>().addDepartment(context);
              },
              minWidth: 200,
              textColor: Colors.white,
              child: const Text("Add Department"),
            ),
          ),
          appBar: AppBar(
            title: const Text("Department"),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                 CustomSearch(
              onChanged: (query) {
                context.read<DepartmentDetailsCubit>().departmentSearch(query);
              },
                ),
                ListView.builder(physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: state.leaveSearchList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.primaries[index],
                            child: Text(state.leaveSearchList[index].department[0]),
                          ),
                          title: Text(state.leaveSearchList[index].department),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
