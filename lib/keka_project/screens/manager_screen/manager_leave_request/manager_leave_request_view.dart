import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_cubit.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManagerLeaveRequest extends StatefulWidget {
  static const String routeName = "/Manager_Leave_Request";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagerLeaveRequestCubit(ManagerLeaveRequestState()),
      child: ManagerLeaveRequest(),
    );
  }

  const ManagerLeaveRequest({super.key});

  @override
  State<ManagerLeaveRequest> createState() => _ManagerLeaveRequestState();
}

class _ManagerLeaveRequestState extends State<ManagerLeaveRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave-Request-List"),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    index.toString(),
                  ),
                  backgroundColor: Colors.primaries[index],
                ),
                title: Text("Name : Pritesh Tala"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Department : Flutter"),
                    Text("DOB : 15-11-2002"),
                    Text("Reason : Fever"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButtonChange(
                          splashColor: Colors.green,
                          child: Text("Accept"),
                          color: Colors.green.shade100,
                          onPressed: () {},
                        ),
                        CustomButtonChange(
                          splashColor: Colors.red,
                          color: Colors.red.shade100,
                          child: Text("Reject"),
                          onPressed: () {},
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
  }
}