import 'package:finaldemo/keka_project/common/common_button.dart';
import 'package:finaldemo/keka_project/common/common_textformfield.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/add_employee/add_employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'add_employee_state.dart';

class AddEmployeeView extends StatefulWidget {
  static const String routeName = "/Add_Employee_view";

  static Widget builder(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Profile?;
    print("add employee::$args");
    return BlocProvider(
      create: (context) => AddEmployeeCubit(
        context,
        AddEmployeeState(
          profile: args,
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          nameController: TextEditingController(),
          mobileController: TextEditingController(),
          dateController: TextEditingController(),
          roleController: TextEditingController(),
          locationController: TextEditingController(),
        ),
      ),
      child: const AddEmployeeView(),
    );
  }

  const AddEmployeeView({super.key});

  @override
  State<AddEmployeeView> createState() => _AddEmployeeViewState();
}

class _AddEmployeeViewState extends State<AddEmployeeView> {
  @override
  void initState() {
    context.read<AddEmployeeCubit>().getDepartmentApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEmployeeCubit, AddEmployeeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: (state.profile == Profile.employee) ? Text("Update Employee Details") : Text("Add Employee Details"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextForm(
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[a-z A-Z ]+'),
                    ),
                  ],
                  controller: state.nameController,
                  readOnly: false,
                  textCapitalization: TextCapitalization.words,
                  obscureText: false,
                  hintText: "Enter Your Name",
                  prefixIcon: const Icon(Icons.person),
                ),
                CustomTextForm(
                  keyboardType: TextInputType.visiblePassword,
                  controller: state.roleController,
                  readOnly: state.profile == Profile.employee ? true : false,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                  hintText: "Enter Your Role",
                  prefixIcon: Icon(Icons.accessibility_sharp),
                ),
                CustomTextForm(
                  controller: state.emailController,
                  readOnly: state.profile == Profile.employee ? true : false,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                  hintText: "Enter Your Email",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                ),
                CustomTextForm(
                  controller: state.locationController,
                  readOnly: state.profile == Profile.employee ? true : false,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                  hintText: "Enter Your Location",
                  prefixIcon: const Icon(Icons.location_pin),
                ),
                (state.profile == Profile.manager)
                    ? CustomTextForm(
                        keyboardType: TextInputType.visiblePassword,
                        controller: state.passwordController,
                        readOnly: state.profile == Profile.employee ? true : false,
                        textCapitalization: TextCapitalization.none,
                        obscureText: state.iconShowHide,
                        hintText: "Enter Your Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () => context.read<AddEmployeeCubit>().visibility(),
                          icon: state.iconShowHide
                              ? const Icon(Icons.visibility_off_sharp)
                              : const Icon(Icons.visibility),
                        ),
                      )
                    : SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.black,
                      inputDecorationTheme: InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                    child: DropdownButtonFormField<Department>(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      isDense: true,
                      hint: const Text('Select Your Department'),
                      value: state.selectedValue,
                      onChanged: (value) {
                        context.read<AddEmployeeCubit>().dropdownSelected(value!);
                      },
                      items: state.departmentList
                          .map(
                            (user) => DropdownMenuItem<Department>(
                              value: user,
                              child: Text(
                                user.name.toString(),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: IntlPhoneField(
                    controller: state.mobileController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (index) {
                      if (index == null) {
                        return 'please fill First Name';
                      } else {
                        return null;
                      }
                    },
                    flagsButtonPadding: const EdgeInsets.all(8),
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      isDense: true,
                      hintText: 'Phone Number',
                      prefixIconColor: Colors.black,
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    initialCountryCode: 'IN',
                  ),
                ),
                CustomTextForm(
                  controller: state.dateController,
                  readOnly: state.profile == Profile.employee ? true : false,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                  prefixIcon: const Icon(Icons.calendar_month),
                  hintText: "Enter Your Birth-Date",
                  onTap: () => context.read<AddEmployeeCubit>().dateTime(context),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    debugPrint("state.selectedValue!.id.toString() ::${state.selectedValue!.id.toString()}");
                    (state.profile == Profile.manager)
                        ? context.read<AddEmployeeCubit>().postEmployeeDetails(
                              state.nameController.text,
                              state.roleController.text,
                              state.emailController.text,
                              state.locationController.text,
                              state.passwordController.text,
                              state.selectedValue!.id.toString(),
                              state.mobileController.text,
                              state.dateController.text,
                            )
                        : context.read<AddEmployeeCubit>().updateEmployeeDetails(
                              state.nameController.text,
                              state.roleController.text,
                              state.locationController.text,
                              state.emailController.text,
                              state.mobileController.text,
                              state.selectedValue!.id.toString(),
                              state.dateController.text,
                            );

                    context.read<AddEmployeeCubit>().navigatorToEmployee(context);
                  },
                  minWidth: 300,
                  child: (state.profile == Profile.employee)
                      ? Text(
                          "Update Details",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      : Text(
                          "Add",
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
