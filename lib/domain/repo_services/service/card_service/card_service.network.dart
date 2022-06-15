import 'dart:convert';

import 'package:task/domain/repo_services/service/card_service/model/card.response.dart';

import '../../../core/abstractions/http_connect.interface.dart';

class CardNetworkService {
  final IHttpConnect _connect;

  const CardNetworkService(IHttpConnect connect) : _connect = connect;

  Future<CardResponse> getAllCardInfoNetwork() async {
    try {
      final response = await _connect.get<CardResponse>(
        '4572d649-fda0-4c84-991d-08ba0961205d',
        headers: {
          'Content-Type': 'application/json',
        },
        decoder: (value) {
          return CardResponse.fromJson(
            value is String
                ? json.decode(value)
                : value as Map<String, dynamic>,
          );
        },
      );

      if (response.success) {
        return response.payload!;
      } else {
        throw 'Check your internet connection!';
      }
    } catch (e) {
      rethrow;
    }
  }
}
