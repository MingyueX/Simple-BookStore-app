import 'package:bookstore/dataset/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  const BookTile(this.book, {Key? key}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 72,
            width: 90,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: OverflowBox(
                    maxHeight: 72 * 2.4,
                    maxWidth: 90 * 2.4,
                    child: Image.network(
                      book.coverImg,
                      fit: BoxFit.fill,
                    ))),
          ),
          const SizedBox(width: 8),
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(book.title),
              Text(book.authors[0]),
              TextButton(
                  onPressed: _read,
                  child: Container(
                      alignment: Alignment.center,
                      height: 30,
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
      ),
    );
  }

  _read() {}
}
