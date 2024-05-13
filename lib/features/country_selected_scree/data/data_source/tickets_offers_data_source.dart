import 'dart:convert';

import 'package:effective_mobile_test/features/country_selected_scree/data/models/ticket_offers_model/ticket_offers_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class TicketsOffersRemoteImpl {
  Future<TicketOffersModel> loadTickets() async {
    final jsonString =
        await rootBundle.loadString('assets/jsons/ticket_offer.json');
    final jsonResponse = jsonDecode(jsonString);
    return TicketOffersModel.fromJson(jsonResponse);
  }
}
