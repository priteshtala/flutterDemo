import 'package:json_annotation/json_annotation.dart';

part 'leave_today_model.g.dart';

@JsonSerializable()
class TodayLeave {
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
  User user;

  TodayLeave({
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

  factory TodayLeave.fromJson(Map<String, dynamic> data) => _$TodayLeaveFromJson(data);

  Map<String, dynamic> toJson() => _$TodayLeaveToJson(this);
}

@JsonSerializable()
class User {
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

  User({
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
  });

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
