abstract class HomeEvent {}

class HomeLoad extends HomeEvent {}

class SavedLoad extends HomeEvent{
  SavedLoad({required this.like});
  final int like;
}
class UnSavedLoad extends HomeEvent{
  UnSavedLoad({required this.unLike});
  final int unLike;
}