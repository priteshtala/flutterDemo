import 'package:bloc/bloc.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'department_details_state.dart';

class DepartmentDetailsCubit extends Cubit<DepartmentDetailsState> {
  DepartmentDetailsCubit()
      : super(
          DepartmentDetailsState(
            departmentList: [
              Department(department: "Flutter"),
              Department(department: "Android"),
              Department(department: "Laravel"),
              Department(department: "PHP"),
              Department(department: "NodeJs"),
              Department(department: "IOS"),
              Department(department: "ReactJS"),
            ],
          ),
        );
}
