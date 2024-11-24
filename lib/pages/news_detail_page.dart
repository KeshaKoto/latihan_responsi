import 'package:flutter/material.dart';
import 'package:latihan_responsi/data/news.dart';
import 'package:latihan_responsi/services/api_news.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsPage extends StatefulWidget {
  final int articleId;

  ArticleDetailsPage(this.articleId);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  Article? _article;

  @override
  void initState() {
    super.initState();
    _fetchArticleDetails();
  }

  Future<void> _fetchArticleDetails() async {
    try {
      final data = await API.getArticleDetails(widget.articleId);
      setState(() {
        _article = Article.fromJson(data);
      });
    } catch (e) {
      print('Error fetching article details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_article == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Article Details'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_article!.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(_article!.imageUrl),
            SizedBox(height: 16.0),
            Text(_article!.summary),
            SizedBox(height: 16.0),
            Text('Published on: ${_article!.publishedAt}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (await canLaunch(_article!.url)) {
                  await launch(_article!.url);
                } else {
                  throw 'Could not launch ${_article!.url}';
                }
              },
              child: Text('Read more'),
            ),
          ],
        ),
      ),
    );
  }
}
