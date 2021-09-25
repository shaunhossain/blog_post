import 'package:blog_posts/bloc/blog_state.dart';
import 'package:blog_posts/data/model/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_posts/bloc/blog_cubit.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BlogCubit>(context).fetchArticleList();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Blog Post"),
        ),
        body: BlocBuilder<BlogCubit, BlogState>(
          builder: (context, state) {
            if (state is! BlogLoaded) {
              return const Center(child: CircularProgressIndicator());
            }

            final articles = (state as BlogLoaded);

            return SingleChildScrollView(
              child: Column(
                //children: articles.map((e) => _articleDetials(e, context)).toList(),
              ),
            );
          },
        ));
  }
}


Widget _articleDetials(Article article, context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(article.title),
      ],
    ),
  );
}