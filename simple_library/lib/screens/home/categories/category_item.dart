import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';

class CategoryItem {
  final Category category;
  final List<Book> books;
  final String countInfo;

  CategoryItem({@required this.category, @required this.books, this.countInfo});
}
