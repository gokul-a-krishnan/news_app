import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news.dart';
import 'package:news_app/bloc/news/bloc.dart';
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
      home: BlocProvider(
        create: (BuildContext context) => NewsBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = '';

  NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();
    newsBloc = BlocProvider.of<NewsBloc>(context);
  }

  @override
  void dispose() {
    newsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (BuildContext context, NewsState state) {
          if (state is NewsError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (BuildContext context, NewsState state) {
          if (state is NewsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsSuccess) {
            return Center(
              child: FutureBuilder(
                future: state.news,
                builder: (context, data) {
                  if (data.connectionState == ConnectionState.done) {
                    print(data.data);
                  }
                  return Text('Success');
                },
              ),
            );
          }
          return buildInitial();
        },
      ),
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
            onPressed: () {
              newsBloc.add(SearchEvent(title));
            },
            child: Text('Search'),
          ),
          SizedBox(),
          RaisedButton(
            onPressed: () {
              newsBloc.add(RecentEvent());
            },
            child: Text('Recent updates'),
          )
        ],
      ),
    );
  }
}
