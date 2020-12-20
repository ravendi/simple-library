import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';

abstract class BookListState extends Equatable {
  const BookListState();
}

class InitialBookListState extends BookListState {
  @override
  List<Object> get props => [];
}

class ShouldShowAddNewBookBottomSheet extends BookListState {
  final Category category;

  ShouldShowAddNewBookBottomSheet({@required this.category});

  @override
  List<Object> get props => [category];
}

class ShouldShowRemoveDialog extends BookListState {
  final Book book;

  ShouldShowRemoveDialog(this.book);

  @override
  List<Object> get props => [book];
}

class BooksLoaded extends BookListState {
  final List<Book> books;

  BooksLoaded(this.books);

  @override
  List<Object> get props => [books];

}

class BookListLoading extends BookListState {
  @override
  List<Object> get props => [];
}