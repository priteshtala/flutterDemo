import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/common_search.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/department_details/department_details_cubit.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/department_details/department_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
    context.read<DepartmentDetailsCubit>().getDepartmentApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentDetailsCubit, DepartmentDetailsState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    context.read<DepartmentDetailsCubit>().addDepartment(context);
                  },
                  child: const Text(
                    "Add Department",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
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
                Gap(10),
                if (state.leaveSearchList.isNotEmpty) ...[
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.leaveSearchList.length,
                    itemBuilder: (context, index) {
                      // print("Length:: ${state.leaveSearchList.length} :::::: ${state.leaveSearchList}");
                      return Column(
                        children: [
                          Card(
                            color: Colors.white,
                            elevation: 3,
                            shadowColor: Colors.white,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.primaries[index],
                                child: Text(state.leaveSearchList[index].name[0],
                                    style: const TextStyle(color: Colors.white)),
                              ),
                              title: Text(state.leaveSearchList[index].name),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ] else if (state.departmentList.isEmpty) ...[
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ] else ...[
                  Text("Data Not Found"),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
