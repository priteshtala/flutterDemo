import 'package:json_annotation/json_annotation.dart';

part 'get_api_model.g.dart';

@JsonSerializable()
class ApiAnimal {
  int? count;
  List<Entry>? entries;

  ApiAnimal({
    this.count,
    this.entries,
  });

  factory ApiAnimal.fromJson(Map<String, dynamic> data) => _$ApiAnimalFromJson(data);

  Map<String, dynamic> toJson() => _$ApiAnimalToJson(this);
}

@JsonSerializable()
class Entry {
  @JsonKey(name: "API")
  String? api;
  @JsonKey(name: "Description")
  String? description;
  @JsonKey(name: "Auth")
  String? auth;
  @JsonKey(name: "HTTPS")
  bool? https;
  @JsonKey(name: "Cors")
  String? cors;
  @JsonKey(name: "Link")
  String? link;
  @JsonKey(name: "Category")
  String? category;

  Entry({
    this.api,
    this.description,
    this.auth,
    this.https,
    this.cors,
    this.link,
    this.category,
  });

  factory Entry.fromJson(Map<String, dynamic> data) => _$EntryFromJson(data);

  Map<String, dynamic> toJson() => _$EntryToJson(this);
}
