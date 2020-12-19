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
    // TODO: Add Logic
  }
}
