import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplelibrary/constants/app_colors.dart';
import 'package:simplelibrary/custom_widgets/simple_library_text.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';
import 'package:simplelibrary/screens/books/bloc/bloc.dart';
import 'package:simplelibrary/screens/books/book_list_element.dart';

class BookList extends StatefulWidget {
  final List<Book> books;
  final Category category;

  const BookList({Key key, @required this.books, @required this.category})
      : super(key: key);

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
      body: BlocConsumer<BookListBloc, BookListState>(
        builder: (_, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 15, 0),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: widget.books
                    .map((element) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: BookListElement(book: element),
                        ))
                    .toList(),
              ),
            ),
          );
        },
        listener: (_, state) {},
      ),
    );
  }
}
