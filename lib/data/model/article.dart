class Article {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Article({
     required this.albumId,
     required this.id,
     required this.title,
     required this.url,
     required this.thumbnailUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
