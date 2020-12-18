import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/book.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class InitialMainState extends MainState {
  @override
  List<Object> get props => [];
}

class DidGetBooks extends MainState {
  final List<Book> allBooks;

  DidGetBooks({@required this.allBooks});

  @override
  List<Object> get props => [allBooks];
}

class DidRemoveBook extends MainState {
  final Book book;
  final List<Book> allBooks;

  DidRemoveBook({@required this.book, @required this.allBooks});

  @override
  List<Object> get props => [book];
}

class DidAddBook extends MainState {
  final Book book;
  final List<Book> allBooks;

  DidAddBook({@required this.book, @required this.allBooks});

  @override
  List<Object> get props => [book];
}

class LoadingBooks extends MainState {
  @override
  List<Object> get props => [];
}