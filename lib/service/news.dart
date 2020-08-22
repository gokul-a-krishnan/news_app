import 'package:dio/dio.dart';
import 'package:news_app/model/news.dart';

class NewsService {
  final String _apiKey = 'e147aebb48734f78b1535cdebb9acc6e';
  final String _baseUrl = 'https://newsapi.org/v2';
  Dio _dio = Dio();

  Future<List<News>> getHeadLines() async {
    _dio.options = BaseOptions(baseUrl: _baseUrl);
    Response res = await _dio.get('/top-headlines',
        queryParameters: {'apiKey': _apiKey, 'country': 'in'});
    return _transform(res.data);
  }

  Future<List<News>> getNews(String title) async {
    _dio.options = BaseOptions(baseUrl: _baseUrl);
    Response res = await _dio
        .get('/everything', queryParameters: {'apiKey': _apiKey, 'q': title});
    return _transform(res.data);
  }

  List<News> _transform(res) {
    List articles = res['articles'];
    List<News> news = List<News>();
    articles.forEach((article) {
      news.add(News.fromJson(article));
    });
    return news;
  }
}
