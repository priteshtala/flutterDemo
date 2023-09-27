// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeLoginDetails _$EmployeeLoginDetailsFromJson(
        Map<String, dynamic> json) =>
    EmployeeLoginDetails(
      id: json['id'] as int?,
      name: json['name'] as String,
      role: json['role'] as String,
      location: json['location'] as String,
      departmentId: json['department_id'] as int,
      email: json['email'] as String,
      mobileNo: json['mobile_no'] as String,
      birthDate: json['birth_date'] as String,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      token: json['device_token'] as String,
    );

Map<String, dynamic> _$EmployeeLoginDetailsToJson(
        EmployeeLoginDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'location': instance.location,
      'department_id': instance.departmentId,
      'email': instance.email,
      'mobile_no': instance.mobileNo,
      'birth_date': instance.birthDate,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'device_token': instance.token,
    };
