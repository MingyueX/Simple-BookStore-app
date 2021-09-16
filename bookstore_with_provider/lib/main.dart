import 'package:bookstore/provider.dart';
import 'package:bookstore/screen/home.dart';
import 'package:bookstore/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ReadList()..load(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BookStore Demo',
        theme: Styles.bookThemeData,
        home: const MyHomePage());
  }
}
