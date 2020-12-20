import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplelibrary/database/database.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';

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
    if (encodedData == null || encodedData.isEmpty) {
      return _predefinedBooks();
    }
    final List booksJson = jsonDecode(encodedData);
    final List<Book> books = booksJson.map((e) => Book.fromJson(e)).toList();
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

  List<Book> _predefinedBooks() {
    final List<Category> categories = [
      Category(name: 'Thriller'),
      Category(name: 'Adventure'),
      Category(name: 'Historical'),
      Category(name: 'Youth'),
      Category(name: 'Horror'),
      Category(name: 'Fantasy'),
      Category(name: 'Biography'),
      Category(name: 'Popular Science'),
    ];
    return [
      Book(name: 'Book1', categories: [categories[0], categories[4]]),
      Book(name: 'Book2', categories: [categories[6]]),
      Book(name: 'Book3', categories: [categories[3]]),
      Book(name: 'Book4', categories: [categories[0], categories[1]]),
      Book(name: 'Book5', categories: [categories[1], categories[2]]),
      Book(
          name: 'Book6',
          categories: [categories[5], categories[6], categories[7]]),
      Book(name: 'Book7', categories: [categories[4], categories[5]]),
      Book(name: 'Book8', categories: [categories[0]]),
      Book(name: 'Book9', categories: [categories[6]]),
      Book(name: 'Book10', categories: [categories[2], categories[4]]),
      Book(
          name: 'Book11',
          categories: [categories[0], categories[1], categories[5]]),
      Book(name: 'Book12', categories: [categories[2], categories[3]]),
      Book(name: 'Book13', categories: [categories[7]]),
      Book(name: 'Book14', categories: [categories[5], categories[6]]),
      Book(name: 'Book15', categories: [categories[6], categories[7]]),
      Book(name: 'Book16', categories: [categories[0], categories[5]]),
      Book(name: 'Book17', categories: [categories[2], categories[4]]),
      Book(name: 'Book18', categories: [categories[0], categories[4]]),
    ];
  }
}
