import 'package:equatable/equatable.dart';

abstract class BookListState extends Equatable {
  const BookListState();
}

class InitialBookListState extends BookListState {
  @override
  List<Object> get props => [];
}
