abstract class SearchEvent{}

class SearchLoad extends SearchEvent{
  final String? title;

  final bool? success;
  SearchLoad({this.title,this.success});
}