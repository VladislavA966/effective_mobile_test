import 'package:json_annotation/json_annotation.dart';

part 'departure.g.dart';

@JsonSerializable()
class Departure {
  String? town;
  String? date;
  String? airport;

  Departure({this.town, this.date, this.airport});

  factory Departure.fromJson(Map<String, dynamic> json) {
    return _$DepartureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DepartureToJson(this);
}
