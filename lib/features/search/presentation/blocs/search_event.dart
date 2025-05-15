abstract class SearchEvent {}

class SearchLoad extends SearchEvent {
  final String? title;
  SearchLoad({this.title});
}

class AddRecentSearch extends SearchEvent {
  final String search;
  AddRecentSearch(this.search);
}

class DeleteText extends SearchEvent {
  final int index;
  DeleteText(this.index);
}

class ClearAllSearches extends SearchEvent {}

class LoadRecentSearches extends SearchEvent {}
