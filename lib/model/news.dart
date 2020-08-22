/// author : "Sports Desk"
/// title : "England vs Pakistan 3rd Test Day 2 Live Cricket Score Updates: Rain halts play with Crawley nearing 200 - The Indian Express"
/// description : "England vs Pakistan, ENG vs PAK 3rd Test Live Cricket Score Streaming Online Today Match: England and Pakistan play the third and final Test at Rose Bowl, Southampton"
/// url : "https://indianexpress.com/article/sports/cricket/england-vs-pakistan-3rd-test-day-2-live-cricket-score-updates-6565393/"
/// urlToImage : "https://images.indianexpress.com/2020/08/eng-v-pak-test-3-day-2.jpg"
/// publishedAt : "2020-08-22T10:29:56Z"
/// content : "The first day of the final Test could not have gone better for England, nor could it have gone much worse for Pakistan. Zak Crawley scored an unbeaten 171, his maiden Test century, and Jos Buttler ra… [+589 chars]"

class News {
  String _author;
  String _title;
  String _description;
  String _url;
  String _urlToImage;
  String _publishedAt;
  String _content;

  String get author => _author;
  String get title => _title;
  String get description => _description;
  String get url => _url;
  String get urlToImage => _urlToImage;
  String get publishedAt => _publishedAt;
  String get content => _content;

  News({
      String author, 
      String title, 
      String description, 
      String url, 
      String urlToImage, 
      String publishedAt, 
      String content}){
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
}

  News.fromJson(dynamic json) {
    _author = json["author"];
    _title = json["title"];
    _description = json["description"];
    _url = json["url"];
    _urlToImage = json["urlToImage"];
    _publishedAt = json["publishedAt"];
    _content = json["content"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["author"] = _author;
    map["title"] = _title;
    map["description"] = _description;
    map["url"] = _url;
    map["urlToImage"] = _urlToImage;
    map["publishedAt"] = _publishedAt;
    map["content"] = _content;
    return map;
  }

}