import 'package:store_app/core/client.dart';

class NewCardRepository{
  final ApiClient client;

  NewCardRepository({required this.client});

  Future<bool>postNewCard( String cardNumber,
      String expiryDate,
      String securityCode,)async{
    return await client.postNewCard(cardNumber, expiryDate, securityCode);

  }
}