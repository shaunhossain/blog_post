import 'package:blog_posts/ui/pages/home_page.dart';
import 'package:blog_posts/ui/route/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
   router: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({Key? key,required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}