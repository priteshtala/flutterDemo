import 'package:json_annotation/json_annotation.dart';
part 'login_details.g.dart';
@JsonSerializable()
class EmployeeLoginDetails {
  int? id;
  String name;
  String role;
  String location;
  @JsonKey(name: "department_id")
  int departmentId;
  String email;
  @JsonKey(name: "mobile_no")
  String mobileNo;
  @JsonKey(name: "birth_date")
  String birthDate;
  @JsonKey(name: "created_at")
  dynamic createdAt;
  @JsonKey(name: "updated_at")
  dynamic updatedAt;
  // @JsonKey(name: "device_token")
  // String token;

  EmployeeLoginDetails({
    this.id,
    required this.name,
    required this.role,
    required this.location,
    required this.departmentId,
    required this.email,
    required this.mobileNo,
    required this.birthDate,
    required this.createdAt,
    required this.updatedAt,
    // required this.token,
  });

  factory EmployeeLoginDetails.fromJson(Map<String, dynamic> data) => _$EmployeeLoginDetailsFromJson(data);

  Map<String, dynamic> toJson() => _$EmployeeLoginDetailsToJson(this);

  }
