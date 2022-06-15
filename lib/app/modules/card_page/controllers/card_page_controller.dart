import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/domain/repository/card/card.repository.dart';

import '../../../../domain/core/model/card/card.model.dart';

class CardPageController extends GetxController {
  final CardRepository _cardRepository;

  CardPageController({
    required CardRepository cardRepository,
  }) : _cardRepository = cardRepository;

  RxList<CardModel> cardList = <CardModel>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    getAllCard();
    super.onInit();
  }

  @override
  void onClose() {}

  void getAllCard() async {
    if (cardList.isEmpty) {
      loading.value = true;
    }
    try {
      cardList.value = await _cardRepository.getMyProfileFromNetwork();
    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
    } finally {
      loading.value = false;
    }
  }
}
