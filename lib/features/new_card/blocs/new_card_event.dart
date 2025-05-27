
sealed class NewCardEvent {}

class NewCardLoad extends NewCardEvent {
  final String cardNumber;
  final String expiryDate;
  final String securityCode;

  NewCardLoad({
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
  });
}
