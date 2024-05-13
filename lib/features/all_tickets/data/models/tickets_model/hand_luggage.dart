import 'package:json_annotation/json_annotation.dart';

part 'hand_luggage.g.dart';

@JsonSerializable()
class HandLuggage {
  @JsonKey(name: 'has_hand_luggage')
  bool? hasHandLuggage;
  String? size;

  HandLuggage({this.hasHandLuggage, this.size});

  factory HandLuggage.fromJson(Map<String, dynamic> json) {
    return _$HandLuggageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HandLuggageToJson(this);
}
