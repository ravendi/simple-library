import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/book.dart';

abstract class Database {
  Future<void> saveBook({@required Book book});
  Future<void> removeBook({@required Book book});
  Future<List<Book>> getAllBooks();
}