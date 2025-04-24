

abstract class SavedEvent{}

class SavedLoading extends SavedEvent{}

class SavedLoadS extends SavedEvent{
  SavedLoadS({required this.like});
  final int like;
}
class UnSavedLoadS extends SavedEvent{
  UnSavedLoadS({required this.unLike});
  final int unLike;
}