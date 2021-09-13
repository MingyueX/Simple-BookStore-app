import 'package:bookstore/dataset/all_books.dart';
import 'package:bookstore/dataset/book.dart';
import 'package:bookstore/tools/apptool.dart';
import 'package:bookstore/widgets/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

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
                      AppTool().popBookDetail(context, books[index1][index2]);
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
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ))
              ]);
            }));
      }),
    )));
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
