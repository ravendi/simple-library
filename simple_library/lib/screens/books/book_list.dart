import 'package:flutter/material.dart';
import 'package:simplelibrary/constants/app_colors.dart';
import 'package:simplelibrary/custom_widgets/simple_library_text.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';

class BookList extends StatefulWidget {
  final List<Book> books;
  final Category category;

  const BookList({Key key, @required this.books, @required this.category}) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.separator,
        title: SimpleLibraryText(
          text: widget.category.name,
          fontSize: 23,
          color: AppColors.mainText,
        ),
      ),
    );
  }
}
