import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/service/news.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: buildInitial(),
    );
  }

  Widget buildInitial() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Interest on: ',
          ),
          TextField(
            onChanged: (data) {
              title = data;
            },
          ),
          RaisedButton(
            onPressed: () async {
              NewsService news = NewsService();
              print(await news.getNews(title));
            },
            child: Text('Search'),
          ),
          SizedBox(),
          RaisedButton(
            onPressed: () async {
              NewsService news = NewsService();
              print(await news.getHeadLines());
            },
            child: Text('Recent updates'),
          )
        ],
      ),
    );
  }
}
