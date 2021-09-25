import 'package:blog_posts/data/model/article.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BlogState {}

class BlogInitial extends BlogState {}
class BlogLoaded extends BlogState {
  final List<Article> articles;

  BlogLoaded({required this.articles});
}