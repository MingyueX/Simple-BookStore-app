// ignore_for_file: use_key_in_widget_constructors

import 'package:bookstore/dataset/book.dart';
import 'package:bookstore/provider.dart';
import 'package:bookstore/widgets/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class BookDialog extends StatelessWidget {
  final Book book;

  const BookDialog({required this.book});

  @override
  Widget build(BuildContext context) {
    // final reading = Provider.of<ReadList>(context);

    return SimpleDialog(
      insetPadding: const EdgeInsets.only(left: 15, right: 15),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(left: 20)),
            BookContainer(book),
            const Padding(padding: EdgeInsets.only(left: 20)),
            SizedBox(
              width: 170,
              height: 240,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      book.title,
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text(
                      getDesc(book),
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black87),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 5)),
                    Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: const [
                          Text(
                            "More Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black45),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 20,
                            color: Colors.black45,
                          )
                        ]),
                    Consumer<ReadList>(builder: (context, reading, child) {
                      if (isInList(book, reading.readList)) {
                        return const Text(
                          'In List',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black54),
                        );
                      } else {
                        return TextButton(
                            onPressed: () => reading.add(book),
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber[600],
                              ),
                              child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: const [
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Icon(
                                      Icons.book,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Text(
                                      "Add to ReadList",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 5))
                                  ]),
                            ));
                      }
                    })
                  ]),
            )
          ],
        ),
      ],
    );
  }

  bool isInList(Book book, List<Book> books) {
    for (Book abook in books) {
      if (abook.id == book.id) {
        return true;
      }
    }
    return false;
  }

  String getDesc(Book book) {
    if (book.shortDesc.isEmpty) {
      return book.longDesc;
    } else {
      return book.shortDesc;
    }
  }
}
