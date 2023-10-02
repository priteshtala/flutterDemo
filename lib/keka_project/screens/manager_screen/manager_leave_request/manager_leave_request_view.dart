import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_cubit.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.pendingLeaveList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          index.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.green.shade200,
                      ),
                      title: Text(state.pendingLeaveList[index].user.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Department : ${state.pendingLeaveList[index].user.role}"),
                          Text("START DATE : ${state.pendingLeaveList[index].startDate}"),
                          Text("END DATE : ${state.pendingLeaveList[index].endDate}"),
                          Text("Reason : ${state.pendingLeaveList[index].reason}"),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomButtonChange(
                                color: Colors.green.shade100,
                                child: Icon(Icons.done),
                                onPressed: () {
                                    context.read<ManagerLeaveRequestCubit>().updateLeaveRequests(0.toString(),index);
                                    context.read<ManagerLeaveRequestCubit>().navigateToManager(context);
                                  },
                                height: 35,
                                width: 50,
                              ),
                              Gap(15),
                              CustomButtonChange(
                                color: Colors.red.shade100,
                                child: Icon(Icons.close),
                                onPressed: () {
                                  context.read<ManagerLeaveRequestCubit>().updateLeaveRequests(2.toString(),index);
                                  context.read<ManagerLeaveRequestCubit>().navigateToManager(context);
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
              ),
            ),
          );
        },
      ),
    );
  }
}
