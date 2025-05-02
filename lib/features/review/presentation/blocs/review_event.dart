abstract class ReviewEvent{}

class ReviewLoad extends ReviewEvent{
  final int id;

  ReviewLoad({required this.id});

}