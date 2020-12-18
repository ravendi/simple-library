import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';

class CategoryItem extends Equatable {
  Category category;
  List<Book> books;
  String countInfo;

  CategoryItem({@required this.category, @required this.books, this.countInfo});

  @override
  List<Object> get props => [category];
}
