import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';
import 'package:simplelibrary/screens/home/categories/category_item.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class InitialCategoriesState extends CategoriesState {
  @override
  List<Object> get props => [];
}

class ShouldNavigateToConcreteCategory extends CategoriesState {
  final Category category;
  final List<Book> books;
  final List<CategoryItem> currentCategoryItems;

  ShouldNavigateToConcreteCategory({@required this.category, @required this.books, @required this.currentCategoryItems});

  @override
  List<Object> get props => [category, books];
}

class DidGetCategoryItems extends CategoriesState {
  final List<CategoryItem> categoryItems;

  DidGetCategoryItems({@required this.categoryItems});

  @override
  List<Object> get props => [categoryItems];
}

class NoBooksInCategory extends CategoriesState {

  @override
  List<Object> get props => [];
}