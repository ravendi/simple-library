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
  List<CategoryItem> _categoryItems;

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

      _categoryItems = [];
      for (var category in categories) {
        final booksForCategory = books
            .where((element) => element.categories.contains(category))
            .toList();
        _categoryItems.add(CategoryItem(
            category: category,
            books: booksForCategory,
            countInfo: booksForCategory == null || booksForCategory.isEmpty
                ? '-'
                : '${booksForCategory.length}'));
        _categoryItems.sort((e1, e2) => e1.category.name.compareTo(e2.category.name));
        yield DidGetCategoryItems(categoryItems: _categoryItems);
      }
    } else if (event is NavigateToConcreteCategoryRequested) {
      final booksForCategory = books
          .where((element) => element.categories.contains(event.category))
          .toList();
      if (booksForCategory == null || booksForCategory.isEmpty) {
        yield NoBooksInCategory();
      } else {
        yield ShouldNavigateToConcreteCategory(
            category: event.category,
            books: booksForCategory,
            currentCategoryItems: _categoryItems);
      }
    }
  }
}
