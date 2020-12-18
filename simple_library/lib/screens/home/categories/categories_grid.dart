import 'package:flutter/material.dart';
import 'package:simplelibrary/model/book.dart';

class CategoriesGrid extends StatefulWidget {
  final List<Book> books;

  const CategoriesGrid({Key key, this.books}) : super(key: key);

  @override
  _CategoriesGridState createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Wrap(

      ),
    );
  }
}
