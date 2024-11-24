import 'package:flutter/material.dart';
import 'package:latihan_responsi/data/report.dart';
import 'package:latihan_responsi/pages/report_detail_page.dart';
import 'package:latihan_responsi/services/api_report.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  List<Report> reports = [];
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchReports();
  }

  Future<void> fetchReports() async {
    try {
      final fetchedReports = await apiService.fetchReports();
      setState(() {
        reports = fetchedReports;
      });
    } catch (e) {
      // Tangani error di sini
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reports',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 42, 36, 36),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: reports.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman detail report
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailReportPage(id: reports[index].id),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.grey[
                        300], // Mengatur latar belakang kartu menjadi abu-abu
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar
                          Container(
                            width: 100,
                            height: 100,
                            child: ClipOval(
                              child: Image.network(
                                reports[index].imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.broken_image, size: 50);
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Kolom untuk teks
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reports[index].title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  reports[index].summary,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Published at: ${reports[index].publishedAt}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
