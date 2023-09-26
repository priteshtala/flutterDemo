// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_today_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayLeave _$TodayLeaveFromJson(Map<String, dynamic> json) => TodayLeave(
      id: json['id'] as int,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      reason: json['reason'] as String,
      userId: json['user_id'] as int,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TodayLeaveToJson(TodayLeave instance) =>
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

User _$UserFromJson(Map<String, dynamic> json) => User(
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
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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
    };
