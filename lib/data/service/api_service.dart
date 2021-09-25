import 'dart:convert';
import 'package:blog_posts/constants/url_path.dart';
import 'package:http/http.dart';

class ApiService{
  Future<List<dynamic>> fetchArticleFromServer() async {
    try {
      final response = await get(Uri.parse(baseUrl + urlPath));
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
}