import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/card_models/card_model.dart';

class CardRepository {
  final ApiClient client;

  CardRepository({required this.client});

  Future<List<CardModel>> fetchCard() async {
    final rawCard = await client.fetchCard();
    final details = rawCard.map((e) => CardModel.fromJson(e)).toList();
    return details;
  }

  Future<bool> deleteCard(int id) async {
    final deletedCard = await client.deleteCard(id);
    return deletedCard;
  }
}
