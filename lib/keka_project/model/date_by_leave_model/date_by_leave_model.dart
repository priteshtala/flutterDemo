import 'package:json_annotation/json_annotation.dart';

part 'date_by_leave_model.g.dart';

@JsonSerializable()
class DateByLeave {
  int id;
  @JsonKey(name: 'start_date')
  DateTime startDate;
  @JsonKey(name: 'end_date')
  DateTime endDate;
  String reason;
  @JsonKey(name: 'user_id')
  int userId;
  String status;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;
  Users user;

  DateByLeave({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory DateByLeave.fromJson(Map<String, dynamic> data) => _$DateByLeaveFromJson(data);

  Map<String, dynamic> toJson() => _$DateByLeaveToJson(this);
}

@JsonSerializable()
class Users {
  int id;
  String name;
  String role;
  String location;
  @JsonKey(name: 'department_id')
  int departmentId;
  String email;
  @JsonKey(name: 'mobile_no')
  String mobileNo;
  @JsonKey(name: 'birth_date')
  DateTime birthDate;
  @JsonKey(name: 'created_at')
  dynamic createdAt;
  @JsonKey(name: 'updated_at')
  dynamic updatedAt;
  @JsonKey(name: 'device_token')
  dynamic deviceToken;

  Users({
    required this.id,
    required this.name,
    required this.role,
    required this.location,
    required this.departmentId,
    required this.email,
    required this.mobileNo,
    required this.birthDate,
    required this.createdAt,
    required this.updatedAt,
    this.deviceToken,
  });

  factory Users.fromJson(Map<String, dynamic> data) => _$UsersFromJson(data);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
