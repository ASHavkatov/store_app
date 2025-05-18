
sealed class NewCardEvent{}
class NewCardSendEvent extends NewCardEvent{
  final String cardNumber;
  final String expiryDate;
  final String securityCode;

  NewCardSendEvent({required this.cardNumber, required this.securityCode, required this.expiryDate});
}