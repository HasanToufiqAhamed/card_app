import 'package:get/get.dart';
import '../repo_services/connect.dart';
import '../repo_services/service/card_service/card_service.network.dart';
import '../repository/card/card.repository.dart';

class CardRepositoryBindings {
  late CardRepository _cardRepository;

  CardRepository get repository => _cardRepository;

  CardRepositoryBindings() {
    final GetConnect getConnect = Get.find<GetConnect>();
    final Connect connect = Connect(connect: getConnect);
    final cardNetworkService = CardNetworkService(connect);
    _cardRepository = CardRepository(cardNetworkService: cardNetworkService);
  }
}
