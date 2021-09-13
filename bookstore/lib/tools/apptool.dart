import 'package:bookstore/dataset/book.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:bookstore/screen/book_detail.dart';

class AppTool {
  popBookDetail(BuildContext context, Book book) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BookDialog(book);
        });
  }
}
