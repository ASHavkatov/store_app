import 'package:store_app/core/client.dart';

class NewCardRepository {
  final ApiClient client;

  NewCardRepository({required this.client});

  Future<bool> postNewCard(String cardNumber, String expiryDate, String securityCode) async {
    final postNewCard = await client.postNewCard(cardNumber, expiryDate, securityCode);
    return postNewCard;
  }

  Future<bool> postNewCard2(String cardNumber, String expiryDate, String securityCode) async {
    final postNewCard2 = await client.postNewCard2(cardNumber, expiryDate, securityCode);
    return postNewCard2;
  }
}
