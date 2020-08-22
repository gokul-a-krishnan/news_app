import 'package:news_app/model/news.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final Future<List<News>> news;

  NewsSuccess(this.news);
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}
