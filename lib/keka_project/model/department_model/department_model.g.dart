// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      name: json['name'] as String,
      createAt: json['created_at'] as dynamic,
      updateAt: json['updated_at'] as dynamic,
    )..id = json['id'] as int?;

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createAt,
      'updated_at': instance.updateAt,
    };
