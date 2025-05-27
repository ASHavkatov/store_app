import 'package:store_app/core/client.dart';

class NewCardRepository {
  final ApiClient client;

  NewCardRepository({required this.client});

  Future<bool> postNewCard({required String cardNumber,required String expiryDate,required String securityCode}) async {
    final postNewCard = await client.postNewCard(cardNumber, expiryDate, securityCode);
    return postNewCard;
  }

}
