import 'package:bookstore/bloc/main_bloc.dart';

import 'package:bookstore/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (BuildContext context) => MainBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'BookStore Demo', home: MyHomePage());
  }
}
