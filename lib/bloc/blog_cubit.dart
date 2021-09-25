
import 'package:bloc/bloc.dart';
import 'package:blog_posts/bloc/blog_state.dart';
import 'package:blog_posts/data/repository/repository.dart';

class BlogCubit extends Cubit<BlogState>{
  final Repository repository;

  BlogCubit({required this.repository}) : super(BlogInitial());

  void fetchArticleList() {
    repository.fetchArticles().then((articles) {
      emit(BlogLoaded(articles: articles));
    });
  }

}