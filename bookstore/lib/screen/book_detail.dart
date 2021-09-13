// ignore_for_file: use_key_in_widget_constructors

import 'package:bookstore/dataset/book.dart';
import 'package:bookstore/widgets/book.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class BookDialog extends StatefulWidget {
  final Book book;

  const BookDialog(this.book);

  @override
  _BookDialogState createState() => _BookDialogState();
}

class _BookDialogState extends State<BookDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      insetPadding: const EdgeInsets.only(left: 15, right: 15),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(left: 20)),
            BookContainer(widget.book),
            const Padding(padding: EdgeInsets.only(left: 20)),
            SizedBox(
              width: 170,
              height: 240,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.book.title,
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text(
                      getDesc(widget.book),
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
                    TextButton(
                        onPressed: _addToReadList,
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
                        ))
                  ]),
            )
          ],
        ),
      ],
    );
  }

  _addToReadList() {}

  String getDesc(Book book) {
    if (book.shortDesc.isEmpty) {
      return book.longDesc;
    } else {
      return book.shortDesc;
    }
  }
}
