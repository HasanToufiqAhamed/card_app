import 'package:flutter/cupertino.dart';
import 'package:task/domain/core/model/card/card.model.dart';
import 'package:task/domain/repo_services/service/card_service/card_service.network.dart';
import 'package:task/domain/repo_services/service/card_service/model/card.response.dart';

class CardRepository {
  final CardNetworkService _cardNetworkService;

  CardRepository({
    required CardNetworkService cardNetworkService,
  }) : _cardNetworkService = cardNetworkService;

  Future<List<CardModel>> getMyProfileFromNetwork() async {
    try {
      CardResponse response = await _cardNetworkService.getAllCardInfoNetwork();

      List<CardModel> c = <CardModel>[];

      for (int a = 0; a != response.data?.transactions?.length; a++) {
        debugPrint('length :::> $a');
        c.add(CardModel.fromJson(response.data!.transactions![a].toJson()));
      }

      return c;
    } catch (e) {
      rethrow;
    }
  }
}
