import 'package:bookstore/dataset/book.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadList extends ChangeNotifier {
  final List<Book> _readList = <Book>[];

  List<Book> get readList => _readList;

  late Future<void> _loading;

  Future<List<Book>> get preferredList async {
    await _loading;
    return List.from(_readList);
  }

  Future<void> saveReadListPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("readList", Book.encode(_readList));
  }

  Future<void> getReadListPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String reading = prefs.getString('readList') ?? '';
    _readList.clear();
    List<Book> readingList = Book.decode(reading);
    for (Book book in readingList) {
      _readList.add(book);
    }
    notifyListeners();
  }

  void load() {
    _loading = getReadListPref();
  }

  Future<void> add(Book book) async {
    _readList.add(book);
    await saveReadListPref();
    notifyListeners();
  }

  Future<void> remove(Book book) async {
    _readList.remove(book);
    await saveReadListPref();
    notifyListeners();
  }
}
