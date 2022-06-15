import 'package:get/get.dart';
import 'package:task/domain/repo_bindings/card.repository.bindings.dart';

import '../controllers/card_page_controller.dart';

class CardPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CardPageController>(
      CardPageController(
        cardRepository: CardRepositoryBindings().repository,
      ),
    );
  }
}
