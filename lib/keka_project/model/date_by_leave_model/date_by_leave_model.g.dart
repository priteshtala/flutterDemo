// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_by_leave_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateByLeave _$DateByLeaveFromJson(Map<String, dynamic> json) => DateByLeave(
      id: json['id'] as int,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      reason: json['reason'] as String,
      userId: json['user_id'] as int,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      user: Users.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateByLeaveToJson(DateByLeave instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'reason': instance.reason,
      'user_id': instance.userId,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user': instance.user,
    };

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
      location: json['location'] as String,
      departmentId: json['department_id'] as int,
      email: json['email'] as String,
      mobileNo: json['mobile_no'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deviceToken: json['device_token'],
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'location': instance.location,
      'department_id': instance.departmentId,
      'email': instance.email,
      'mobile_no': instance.mobileNo,
      'birth_date': instance.birthDate.toIso8601String(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'device_token': instance.deviceToken,
    };
