import 'dart:async';
import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';
import 'package:simplelibrary/screens/home/categories/category_item.dart';
import './bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final List<Book> books;

  CategoriesBloc({@required this.books});

  @override
  CategoriesState get initialState => InitialCategoriesState();

  @override
  Stream<CategoriesState> mapEventToState(
    CategoriesEvent event,
  ) async* {
    if (event is GetCategoryItemsRequested) {
      List<Category> categories = [];
      for (var book in books) {
        categories.addAll(book.categories);
      }
      categories = LinkedHashSet<Category>.from(categories).toList();

      List<CategoryItem> categoryItems = [];
      for (var category in categories) {
        final booksForCategory = books
            .where((element) => element.categories.contains(category))
            .toList();
        categoryItems.add(CategoryItem(
            category: category,
            books: booksForCategory,
            countInfo: booksForCategory == null || booksForCategory.isEmpty
                ? '-'
                : booksForCategory.length));
      }
    } else if (event is NavigateToConcreteCategoryRequested) {
      final booksForCategory =
          books.where((element) => element.categories.contains(event.category));
      if (booksForCategory == null || booksForCategory.isEmpty) {
        yield NoBooksInCategory();
      } else {
        yield ShouldNavigateToConcreteCategory(
            category: event.category, books: booksForCategory);
      }
    }
  }
}