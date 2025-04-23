sealed class DetailEvent{}

class DetailLoading extends DetailEvent{
  final int id;
  DetailLoading({required this.id});
}