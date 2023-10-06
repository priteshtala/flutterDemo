import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_cubit.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class ManagerLeaveRequest extends StatefulWidget {
  static const String routeName = "/Manager_Leave_Request";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagerLeaveRequestCubit(
        ManagerLeaveRequestState(),
      ),
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
            color: Colors.green,
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
                        return Slidable(
                          endActionPane: ActionPane(motion: DrawerMotion(), children: [
                            SlidableAction(
                              borderRadius: BorderRadius.circular(14),
                              onPressed: (v) {
                                context.read<ManagerLeaveRequestCubit>().updateLeaveRequests(0.toString(), index);
                                Navigator.of(context).pop();
                              },
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              icon: Icons.done,
                              label: 'Accept',
                            ),
                            SlidableAction(
                              borderRadius: BorderRadius.circular(14),
                              onPressed: (v) {
                                context.read<ManagerLeaveRequestCubit>().updateLeaveRequests(2.toString(), index);
                                Navigator.of(context).pop();
                              },
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.close,
                              label: 'Cancel',
                            ),
                          ]),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
                                  Text("Start Date : ${startDate}"),
                                  Text("End Date : ${endDate}"),
                                  Text("Reason : ${state.pendingLeaveList[index].reason}"),
                                  const Gap(10),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
