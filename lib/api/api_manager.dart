

import 'dart:convert';

import 'package:api_calling/constants/strings.dart';
import 'package:api_calling/models/newsInfo.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}