import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_cubit.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class ManagerLeaveRequest extends StatefulWidget {
  static const String routeName = "/Manager_Leave_Request";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagerLeaveRequestCubit(ManagerLeaveRequestState(pendingLeaveList: [])),
      child: ManagerLeaveRequest(),
    );
  }

  const ManagerLeaveRequest({super.key});

  @override
  State<ManagerLeaveRequest> createState() => _ManagerLeaveRequestState();
}

class _ManagerLeaveRequestState extends State<ManagerLeaveRequest> {
  @override
  void initState() {
    super.initState();
    context.read<ManagerLeaveRequestCubit>().pendingLeave();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave-Request-List"),
      ),
      body: BlocBuilder<ManagerLeaveRequestCubit, ManagerLeaveRequestState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => context.read<ManagerLeaveRequestCubit>().refresh(),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: (state.pendingLeaveList.isNotEmpty)
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.pendingLeaveList.length,
                      itemBuilder: (context, index) {
                        final DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                        String startDate =
                            dateFormat.format(DateTime.parse(state.pendingLeaveList[index].startDate.toString()));
                        String endDate =
                            dateFormat.format(DateTime.parse(state.pendingLeaveList[index].endDate.toString()));
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                state.pendingLeaveList[index].user.name[0].toUpperCase(),
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              backgroundColor: Colors.green,
                            ),
                            title: Text(state.pendingLeaveList[index].user.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Department : ${state.pendingLeaveList[index].user.role}"),
                                Text("START DATE : ${startDate}"),
                                Text("END DATE : ${endDate}"),
                                Text("Reason : ${state.pendingLeaveList[index].reason}"),
                                const Gap(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomButtonChange(
                                      color: Colors.green.shade100,
                                      child: Icon(Icons.done),
                                      onPressed: () {
                                        context
                                            .read<ManagerLeaveRequestCubit>()
                                            .updateLeaveRequests(0.toString(), index)
                                            .then(
                                              (value) =>
                                                  context.read<ManagerLeaveRequestCubit>().navigateToManager(context),
                                            );
                                      },
                                      height: 35,
                                      width: 50,
                                    ),
                                    Gap(15),
                                    CustomButtonChange(
                                      color: Colors.red.shade100,
                                      child: Icon(Icons.close),
                                      onPressed: () {
                                        context
                                            .read<ManagerLeaveRequestCubit>()
                                            .updateLeaveRequests(2.toString(), index)
                                            .then(
                                              (value) =>
                                                  context.read<ManagerLeaveRequestCubit>().navigateToManager(context),
                                            );
                                      },
                                      width: 50,
                                      height: 35,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        },
      ),
    );
  }
}
