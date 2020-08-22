import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/news.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
