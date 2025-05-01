abstract class SearchEvent{}

class SearchLoad extends SearchEvent{
  final String? title;
  SearchLoad({this.title});
}