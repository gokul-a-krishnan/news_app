abstract class NewsEvent {}

class SearchEvent extends NewsEvent {
  final String title;

  SearchEvent(this.title);
}

class RecentEvent extends NewsEvent {}
