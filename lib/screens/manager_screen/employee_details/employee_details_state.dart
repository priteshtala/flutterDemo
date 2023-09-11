import 'package:equatable/equatable.dart';

class EmployeeDetailsState extends Equatable {
  @override
  List<Object?> get props => [];

  List dropDownList;

  EmployeeDetailsState({
    this.dropDownList = const [],
  });

  EmployeeDetailsState copyWith({
    List? dropDownList,
  }) {
    return EmployeeDetailsState(
      dropDownList: dropDownList ?? this.dropDownList,
    );
  }
}
