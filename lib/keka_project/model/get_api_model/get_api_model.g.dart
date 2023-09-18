// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiAnimal _$ApiAnimalFromJson(Map<String, dynamic> json) => ApiAnimal(
      count: json['count'] as int?,
      entries: (json['entries'] as List<dynamic>?)
          ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiAnimalToJson(ApiAnimal instance) => <String, dynamic>{
      'count': instance.count,
      'entries': instance.entries,
    };

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      api: json['API'] as String?,
      description: json['Description'] as String?,
      auth: json['Auth'] as String?,
      https: json['HTTPS'] as bool?,
      cors: json['Cors'] as String?,
      link: json['Link'] as String?,
      category: json['Category'] as String?,
    );

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'API': instance.api,
      'Description': instance.description,
      'Auth': instance.auth,
      'HTTPS': instance.https,
      'Cors': instance.cors,
      'Link': instance.link,
      'Category': instance.category,
    };
