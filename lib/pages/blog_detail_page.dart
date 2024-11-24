import 'package:flutter/material.dart';
import 'package:latihan_responsi/data/blog.dart';
import 'package:url_launcher/url_launcher.dart'; // Pastikan untuk mengimpor package ini

class BlogDetailPage extends StatelessWidget {
  final Blog blog;

  BlogDetailPage({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(blog.imageUrl), // Menampilkan gambar
              SizedBox(height: 16),
              Text(
                blog.summary,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Membuka URL di browser
                  if (await canLaunch(blog.url)) {
                    await launch(blog.url);
                  } else {
                    throw 'Could not launch ${blog.url}';
                  }
                },
                child: Text('Read more'),
              ),
              SizedBox(height: 16),
              Text(
                'Published on: ${blog.publishedAt.toLocal().toString().split(' ')[0]}', // Menampilkan tanggal publikasi
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                'Source: ${blog.newsSite}', // Menampilkan sumber berita
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
