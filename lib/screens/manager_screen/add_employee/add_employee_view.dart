import 'package:finaldemo/keka_project/comman/comman_textformfield.dart';
import 'package:finaldemo/screens/manager_screen/add_employee/add_employee_cubit.dart';
import 'package:finaldemo/screens/manager_screen/add_employee/add_employee_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AddEmployeeView extends StatefulWidget {
  static const String routeName = "/Add_Employee_view";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEmployeeCubit(AddEmployeeState()),
      child: AddEmployeeView(),
    );
  }

  const AddEmployeeView({super.key});

  @override
  State<AddEmployeeView> createState() => _AddEmployeeViewState();
}

class _AddEmployeeViewState extends State<AddEmployeeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEmployeeCubit, AddEmployeeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Add-Employee"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                CustomTextForm(
                    readOnly: false,
                    textCapitalization: TextCapitalization.none,
                    obscureText: false,
                    hintText: "Enter Your Name",
                    prefixIcon: Icon(Icons.person)),
                CustomTextForm(
                  // controller: state.emailController,
                  readOnly: false,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                  hintText: "Enter Your Email",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                ),
                CustomTextForm(
                  // controller: state.passwordController,
                  readOnly: false,
                  textCapitalization: TextCapitalization.none,
                  obscureText: state.iconShowHide,
                  hintText: "Enter Your Password",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () => context.read<AddEmployeeCubit>().visibility(),
                    icon: state.iconShowHide ? const Icon(Icons.visibility_off_sharp) : const Icon(Icons.visibility),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                  child: IntlPhoneField(
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
                      // prefixIcon: prefixIcon,
                      // suffixIcon: suffixIcon,
                      prefixIconColor: Colors.black,
                      hintStyle: const TextStyle(color: Colors.grey),
                      // fillColor: Colors.white70,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    initialCountryCode: 'IN',
                    // onChanged: (phone) {
                    //
                    // },
                  ),
                ),
                CustomTextForm(
                  readOnly: false,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
