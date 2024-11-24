import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static const String _baseUrl =
      'https://api.spaceflightnewsapi.net/v4/articles/';

  static Future<Map<String, dynamic>> getArticles(
      {int limit = 10, int offset = 0}) async {
    final response =
        await http.get(Uri.parse('$_baseUrl?limit=$limit&offset=$offset'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch articles');
    }
  }

  static Future<Map<String, dynamic>> getArticleDetails(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl$id/'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch article details');
    }
  }
}
