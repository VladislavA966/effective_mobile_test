import 'package:json_annotation/json_annotation.dart';

part 'arrival.g.dart';

@JsonSerializable()
class Arrival {
  String? town;
  String? date;
  String? airport;

  Arrival({this.town, this.date, this.airport});

  factory Arrival.fromJson(Map<String, dynamic> json) {
    return _$ArrivalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArrivalToJson(this);
}
