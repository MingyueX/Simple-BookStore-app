import 'package:bookstore/dataset/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  const BookTile(this.book, {Key? key}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: OverflowBox(
                  maxHeight: 72 * 2.4,
                  maxWidth: 72 * 2.4,
                  child: Image.network(
                    book.coverImg,
                    fit: BoxFit.fill,
                  ))),
        ),
        const SizedBox(width: 20),
        Flexible(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.title,
                softWrap: true,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Text(book.authors[0], style: const TextStyle(fontSize: 14)),
            TextButton(
                onPressed: _read,
                child: Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87,
                    ),
                    child: const Text("Read",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white))))
          ],
        ))
      ],
    );
  }

  _read() {}
}
