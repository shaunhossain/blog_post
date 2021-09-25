import 'package:blog_posts/bloc/blog_cubit.dart';
import 'package:blog_posts/data/repository/repository.dart';
import 'package:blog_posts/data/service/api_service.dart';
import 'package:blog_posts/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late Repository repository;
  late BlogCubit blogCubit;

  AppRouter() {
    repository = Repository(apiService: ApiService());
    blogCubit = BlogCubit(repository: repository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: blogCubit,
            child: const HomePage(),
          ),
        );
      default:
        return null;
    }
  }
}