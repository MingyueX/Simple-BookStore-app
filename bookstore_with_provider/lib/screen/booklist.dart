import 'package:bookstore/dataset/all_books.dart';
import 'package:bookstore/dataset/book.dart';
import 'package:bookstore/widgets/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

import 'book_detail.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    List<List<Book>> books = partition(BookFromWeb.bookList, 2).toList();

    return SafeArea(
        child: Column(children: [
      AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'BookStore',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline2,
        ),
        titleSpacing: 30,
      ),
      Expanded(
          child: SingleChildScrollView(
              child: Column(
        children: List.generate(books.length, (index1) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(books[index1].length, (index2) {
                return Column(children: [
                  const Padding(padding: EdgeInsets.only(bottom: 15)),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BookDialog(book: books[index1][index2]);
                            });
                        // AppTool().popBookDetail(context, books[index1][index2]);
                      },
                      child: BookContainer(books[index1][index2])),
                  const Padding(padding: EdgeInsets.only(bottom: 15)),
                  SizedBox(
                      width: 180,
                      child: Text(
                        books[index1][index2].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1,
                      ))
                ]);
              }));
        }),
      )))
    ]));
  }
}

/*
class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(0.0, 0.0, 165, 200);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
*/
