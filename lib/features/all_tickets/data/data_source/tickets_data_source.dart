import 'dart:convert';

import 'package:effective_mobile_test/features/all_tickets/data/models/tickets_model/tickets_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class TicketsDataSource {
  Future<TicketsModel> getTickets() async {
    final jsonString = await rootBundle.loadString('assets/jsons/tickets.json');
    final jsonResponse = jsonDecode(jsonString);
    return TicketsModel.fromJson(jsonResponse);
  }
}
