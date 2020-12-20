import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';

abstract class BookListEvent extends Equatable {
  const BookListEvent();
}

class DidPressAddNewBook extends BookListEvent {
  final Category category;

  DidPressAddNewBook({@required this.category});

  @override
  List<Object> get props => [category];
}

class RemoveBookInitiated extends BookListEvent {
  final Book book;

  RemoveBookInitiated(this.book);

  @override
  List<Object> get props => [];
}

class ReloadBooksInCurrentCategoryRequested extends BookListEvent {
  final Category category;
  final List<Book> allBooks;

  ReloadBooksInCurrentCategoryRequested({@required this.category, @required this.allBooks});

  @override
  List<Object> get props => [category, allBooks];
}