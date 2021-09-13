import 'package:bookstore/screen/booklist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title: const Text(
            'BookStore',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          titleSpacing: 30,
        ),
        body: const BookPage(),
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
  }
}
