import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_cubit.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
          itemCount: 7,
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
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomButtonChange(
                          color: Colors.green.shade100,
                          child: Icon(Icons.done),
                          onPressed: () {}, width: 50, height: 35,
                        ),

                        Gap(15),
                        CustomButtonChange(
                          color: Colors.red.shade100,
                          child: Icon(Icons.close),
                          onPressed: () {}, width: 50, height: 35,
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
