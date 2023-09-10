import 'package:json_annotation/json_annotation.dart';
part 'leave_model.g.dart';
@JsonSerializable()
class Leave {
  String name;
  String surname;

  Leave({
    required this.name,
    required this.surname,
  });

  factory Leave.fromJson(Map<String, dynamic> data) => _$LeaveFromJson(data);

  Map<String, dynamic> toJson() => _$LeaveToJson(this);
}
