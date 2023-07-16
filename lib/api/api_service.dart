import 'dart:convert';
import 'package:app_news/model/article.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String category;

  ApiService({required this.category});

  static final String _baseUrl = 'https://newsapi.org/v2/';
  static final String _apiKey = '9dd0e62ed23b4502b93afb114b5d6332';
  static final String _country = 'us';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl +
        "top-headlines?country=$_country&category=$category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
