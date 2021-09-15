import 'dart:convert';

class Book {
  Book({
    required this.id,
    required this.title,
    required this.pageCount,
    required this.coverImg,
    required this.shortDesc,
    required this.longDesc,
    required this.authors,
    required this.categories,
  });

  int id;

  String title;

  int pageCount;

  String coverImg;

  String shortDesc;

  String longDesc;

  List<String> authors;

  List<String> categories;

  factory Book.fromJson(Map<String, dynamic> jsonData) {
    return Book(
        id: jsonData['id'],
        title: jsonData['title'],
        pageCount: jsonData['pageCount'],
        coverImg: jsonData['coverImg'],
        shortDesc: jsonData['shortDesc'],
        longDesc: jsonData['longDesc'],
        authors: jsonData['authors'].cast<String>(),
        categories: jsonData['categories'].cast<String>());
  }

  static Map<String, dynamic> toMap(Book book) => {
        'id': book.id,
        'title': book.title,
        'pageCount': book.pageCount,
        'coverImg': book.coverImg,
        'shortDesc': book.shortDesc,
        'longDesc': book.longDesc,
        'authors': book.authors,
        'categories': book.categories
      };

  static String encode(List<Book> books) => json.encode(
      books.map<Map<String, dynamic>>((book) => Book.toMap(book)).toList());

  static List<Book> decode(String books) {
    List<Book> list = <Book>[];
    if (books.isNotEmpty) {
      return (json.decode(books) as List<dynamic>)
          .map<Book>((item) => Book.fromJson(item))
          .toList();
    } else {
      return list;
    }
  }
}
