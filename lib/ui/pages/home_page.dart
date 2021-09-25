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

            final articleLoadState = (state as BlogLoaded);
            final articles = articleLoadState.articles.toList();

            return  ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final articleDetails = articles[index];

                return _articleDetials(articleDetails);
              },
            );
            //   SingleChildScrollView(
            //   child: Column(
            //     //children: articles.map((e) => _articleDetials(e, context)).toList(),
            //   ),
            // );
          },
        ));
  }
}


Widget _articleDetials(Article article) => ListTile(
  leading: Image.network(
    article.thumbnailUrl,
    fit: BoxFit.cover,
    width: 50,
    height: 50,
  ),
  title: Text(article.title),
  subtitle: Text(article.url),
);