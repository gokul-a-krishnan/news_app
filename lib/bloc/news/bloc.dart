import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:news_app/bloc/news.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/service/news.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial());
  NewsService _service = NewsService();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    yield NewsLoading();
    try {
      if (event is SearchEvent) {
        Future<List<News>> news = _service.getNews(event.title);
        yield NewsSuccess(news);
      }
      if (event is RecentEvent) {
        Future<List<News>> news = _service.getHeadLines();
        yield NewsSuccess(news);
      }
    } on DioError catch (err) {
      yield NewsError(err.message);
    }
  }
}
