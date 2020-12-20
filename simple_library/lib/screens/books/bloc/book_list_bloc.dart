import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  @override
  BookListState get initialState => InitialBookListState();

  @override
  Stream<BookListState> mapEventToState(
    BookListEvent event,
  ) async* {
    if (event is DidPressAddNewBook) {
      yield ShouldShowAddNewBookBottomSheet(category: event.category);
    } else if (event is DidFinishProcessOfAddingNewBook) {
      yield InitialBookListState();
    } else if (event is ReloadBooksInCurrentCategory) {
      final booksForCategory = event.allBooks
          .where((element) => element.categories.contains(event.category))
          .toList();
      yield BooksLoaded(booksForCategory);
    }
  }
}
