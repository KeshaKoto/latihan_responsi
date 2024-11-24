class Report {
  final int id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final DateTime publishedAt;

  Report({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      imageUrl: json['image_url'],
      newsSite: json['news_site'],
      summary: json['summary'],
      publishedAt: DateTime.parse(json['published_at']),
    );
  }
}
