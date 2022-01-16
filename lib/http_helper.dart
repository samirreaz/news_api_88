import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_api_88/News.dart';

class HttpHelper {
  Future<News> getNews() async {
    var client = http.Client();
    var newsData = null;
    try {
      var url = Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=fa2266bb6b764af8816b75d85ef70762',
      );
      var response = await client.get(url);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsData = News.fromJson(jsonMap);
      }
    } catch (Exception) {
      debugPrint('Error');
      return newsData;
    }
    return newsData;
  }
}
