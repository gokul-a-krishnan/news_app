abstract class NewsEvent {}

class SearchEvent extends NewsEvent {
  final String search;

  SearchEvent(this.search);
}

class RecentEvent extends NewsEvent {}
