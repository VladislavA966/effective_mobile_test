// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOffersModel _$TicketOffersModelFromJson(Map<String, dynamic> json) =>
    TicketOffersModel(
      ticketsOffers: (json['tickets_offers'] as List<dynamic>?)
          ?.map((e) => TicketsOfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketOffersModelToJson(TicketOffersModel instance) =>
    <String, dynamic>{
      'tickets_offers': instance.ticketsOffers,
    };
