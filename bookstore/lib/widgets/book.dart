import 'package:bookstore/dataset/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookContainer extends StatelessWidget {
  final Book book;

  // ignore: use_key_in_widget_constructors
  const BookContainer(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        height: 200,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ]),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            // clipper: MyClipper(),
            child: Image.network(
              book.coverImg,
              fit: BoxFit.fill,
            )));
  }
}
