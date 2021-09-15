import 'package:bookstore/bloc/main_bloc.dart';
import 'package:bookstore/dataset/book.dart';
import 'package:bookstore/screen/booklist.dart';
import 'package:bookstore/screen/readlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late final _readList;
  int _selectedIndex = 0;
  late Widget bookpage;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _selectPage(List<Book> list) {
    if (_selectedIndex == 0) {
      return bookpage;
    } else {
      return ReadPage(list);
    }
  }

  @override
  Widget build(BuildContext context) {
    bookpage = const BookPage();

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Scaffold(
          body: _selectPage(state.readList),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border:
                    Border(top: BorderSide(color: Colors.black12, width: 0.5))),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_books),
                  label: 'Library',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'ReadList',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
          ));
    });
  }
}
