import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplelibrary/database/database.dart';
import 'package:simplelibrary/model/book.dart';

class LocalStorageDatabase implements Database {
  final _localStorage = SharedPreferences.getInstance();
  
  final _booksKey = 'books';
  
  @override
  Future<void> saveBook({Book book}) async {
    final books = await getAllBooks();
    books?.add(book);
    _saveBooks(books);
  }

  @override
  Future<List<Book>> getAllBooks() async {
    String encodedData;
    try {
      encodedData = (await _localStorage).getString(_booksKey);
    } catch (error) {
      print(error);
      return null;
    }
    final List<Book> books = jsonDecode(encodedData);
    return books;
  }

  @override
  Future<void> removeBook({Book book}) async {
    final books = await getAllBooks();
    books.removeWhere((element) => element.name == book.name);
    _saveBooks(books);
  }

  Future<void> _saveBooks(List<Book> books) async {
    final encodedData = jsonEncode(books?.map((e) => e.toJson())?.toList());
    return (await _localStorage).setString(_booksKey, encodedData);
  }
}