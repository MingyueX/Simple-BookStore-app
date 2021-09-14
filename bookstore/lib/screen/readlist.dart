import 'package:bookstore/dataset/book.dart';
import 'package:bookstore/widgets/booklist_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadPage extends StatelessWidget {
  const ReadPage(this.readlist, {Key? key}) : super(key: key);

  final List<Book> readlist;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CupertinoNavigationBar(middle: Text('My ReadList')),
      readlist.isEmpty
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                '\nYou haven\'t added any book to your readList yet.',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            )
          : ListView(
              children: [
                const SizedBox(height: 24),
                for (Book book in readlist)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    child: BookTile(book),
                  ),
              ],
            )
    ]);
  }
}
