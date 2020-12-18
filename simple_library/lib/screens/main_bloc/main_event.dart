import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/book.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class GetBooksRequested extends MainEvent {
  @override
  List<Object> get props => [];
}

class RemoveBookRequested extends MainEvent {
  final Book book;

  RemoveBookRequested({@required this.book});

  @override
  List<Object> get props => [book];
}

class AddBookRequested extends MainEvent {
  final Book book;

  AddBookRequested({@required this.book});

  @override
  List<Object> get props => [book];
}