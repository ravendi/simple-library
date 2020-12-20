import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/database/database.dart';
import 'package:simplelibrary/model/book.dart';
import './bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final Database database;
  List<Book> books;

  MainBloc({@required this.database});

  @override
  MainState get initialState => InitialMainState();

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    yield LoadingBooks();
    if (event is GetBooksRequested) {
      // Fake delay
      await Future.delayed(Duration(seconds: 2));
      books = await database.getAllBooks();
      yield DidGetBooks(allBooks: books);
    } else if (event is RemoveBookRequested) {
      books.remove(event.book);
      await database.removeBook(book: event.book);
      yield (DidRemoveBook(book: event.book, allBooks: books));
    } else if (event is AddBookRequested) {
      books.add(event.book);
      await database.saveBook(book: event.book);
      yield DidAddBook(book: event.book, allBooks: books);
    }
  }
}
