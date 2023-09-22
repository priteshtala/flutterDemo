// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
      location: json['location'] as String,
      departmentId: json['department_id'] as int,
      email: json['email'] as String,
      mobileNo: json['mobile_no'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      department:
          Departments.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'location': instance.location,
      'department_id': instance.departmentId,
      'email': instance.email,
      'mobile_no': instance.mobileNo,
      'birth_date': instance.birthDate.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'department': instance.department,
    };

Departments _$DepartmentsFromJson(Map<String, dynamic> json) => Departments(
      id: json['id'] as int,
      name: json['name'] as String,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$DepartmentsToJson(Departments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
