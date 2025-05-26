sealed class NewCardEvent {}

class PostNewCardLoad extends NewCardEvent {}

class PostNewCardEvent extends NewCardEvent {
  final String cardNumber;
  final String expiryDate;
  final String securityCode;

  PostNewCardEvent({required this.cardNumber, required this.securityCode, required this.expiryDate});
}

class PostNewCardEvent2 extends NewCardEvent {
  final String cardNumber, expiryDate, securityCode;

  PostNewCardEvent2({required this.cardNumber, required this.expiryDate, required this.securityCode});
}
