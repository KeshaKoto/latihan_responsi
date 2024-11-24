import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_responsi/data/report.dart';

class ApiService {
  final String baseUrl = 'https://api.spaceflightnewsapi.net/v4/reports/';

  Future<List<Report>> fetchReports() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['results'];
      return jsonData.map((json) => Report.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reports');
    }
  }
}
