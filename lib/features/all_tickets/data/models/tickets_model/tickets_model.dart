import 'package:json_annotation/json_annotation.dart';

import 'ticket.dart';

part 'tickets_model.g.dart';

@JsonSerializable()
class TicketsModel {
  List<Ticket>? tickets;

  TicketsModel({this.tickets});

  factory TicketsModel.fromJson(Map<String, dynamic> json) {
    return _$TicketsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TicketsModelToJson(this);
}
