import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_responsi/data/blog.dart';

class ApiService {
  final String baseUrl = 'https://api.spaceflightnewsapi.net/v4/blogs/';

  Future<List<Blog>> fetchBlogs() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> results = jsonData['results'];
        return results.map((json) => Blog.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load blogs');
      }
    } catch (e) {
      throw Exception('Failed to load blogs: $e');
    }
  }
}
