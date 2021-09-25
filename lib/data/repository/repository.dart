import 'package:blog_posts/data/model/article.dart';
import 'package:blog_posts/data/service/api_service.dart';

class Repository{

  final ApiService apiService;

  Repository({required this.apiService});

  Future<List<Article>> fetchArticles() async {
    final articleData = await apiService.fetchArticleFromServer();
    return articleData.map((e) => Article.fromJson(e)).toList();
  }
}