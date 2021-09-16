import 'package:bookstore/dataset/book.dart';
import 'package:bookstore/provider.dart';
import 'package:bookstore/widgets/booklist_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ReadPage extends StatelessWidget {
  const ReadPage(this.readlist, {Key? key}) : super(key: key);

  final List<Book> readlist;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CupertinoNavigationBar(middle: Text('My ReadList')),
      readlist.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                '\nYou haven\'t added any book to your readList yet.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            )
          : Expanded(
              child: ListView(children: [
              // const SizedBox(height: 14),
              for (Book book in readlist)
                Consumer<ReadList>(builder: (context, reading, child) {
                  return Column(children: [
                    Slidable(
                        key: const ValueKey(0),
                        actionExtentRatio: 0.25,
                        actionPane: const SlidableDrawerActionPane(),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                              caption: "Remove",
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () => reading.remove(book))
                        ],
                        child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: BookTile(book))),
                    const Divider()
                  ]);
                })
            ]))
    ]);
  }
}
