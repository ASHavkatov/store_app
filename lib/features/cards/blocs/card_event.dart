class CardEvent{}

class CardLoad extends CardEvent{}

class DeleteCardEvent extends CardEvent{
  final int id;
  DeleteCardEvent({required this.id});
}