import 'package:flutter/material.dart';
import 'package:latihan_responsi/data/blog.dart';
import 'package:latihan_responsi/services/api_blog.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogsPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blogs',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 42, 36, 36),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Blog>>(
        future: apiService.fetchBlogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No blogs found.'));
          }

          final blogs = snapshot.data!;

          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return Card(
                color: Colors
                    .grey[300], // Mengatur latar belakang kartu menjadi abu-abu
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Image.network(blog.imageUrl,
                      width: 100, fit: BoxFit.cover),
                  title: Text(blog.title),
                  subtitle: Text(blog.summary),
                  onTap: () {
                    // Tindakan saat card di-tap (misalnya, membuka URL)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogDetailPage(blog: blog),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BlogDetailPage extends StatelessWidget {
  final Blog blog;

  BlogDetailPage({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(blog.imageUrl),
            SizedBox(height: 16),
            Text(
              blog.summary,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Buka URL di browser
                launch(blog.url);
              },
              child: Text('Read more'),
            ),
          ],
        ),
      ),
    );
  }
}
