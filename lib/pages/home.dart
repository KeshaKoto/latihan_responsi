import 'package:flutter/material.dart';
import 'package:latihan_responsi/pages/news.dart';
import 'package:latihan_responsi/pages/blog.dart';
import 'package:latihan_responsi/pages/report.dart'; // Mengimpor halaman ReportPage

class HomePage extends StatelessWidget {
  final String username;

  HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hai, $username!",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 42, 36, 36),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  NewsCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticlesPage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  BlogCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogsPage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  ReportCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ReportPage(), // Arahkan ke ReportPage
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final VoidCallback onTap;

  NewsCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color:
            Colors.grey[300], // Mengatur latar belakang kartu menjadi abu-abu
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                'images/news.png', // Ganti dengan path gambar yang sesuai
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'News',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Get an overview of the latest Spaceflight news, from various sources. Easily link users to the right websites.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final VoidCallback onTap;

  BlogCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color:
            Colors.grey[300], // Mengatur latar belakang kartu menjadi abu-abu
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                'images/blog.jpg', // Ganti dengan path gambar yang sesuai
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blog',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final VoidCallback onTap; // Tambahkan parameter onTap

  ReportCard({required this.onTap}); // Tambahkan parameter dalam konstruktor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Menangani klik
      child: Card(
        color:
            Colors.grey[300], // Mengatur latar belakang kartu menjadi abu-abu
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                'images/report.jpg', // Ganti dengan path gambar yang sesuai
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Report',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Space stations and other missions often publish their data. With SNAP!, you can include it in your report.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
