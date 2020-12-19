import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/screens/books/book_list.dart';
import 'package:simplelibrary/screens/home/categories/bloc/bloc.dart';
import 'package:simplelibrary/screens/home/categories/category_item.dart';
import 'package:simplelibrary/screens/home/categories/category_item_tile.dart';

class CategoriesGrid extends StatefulWidget {
  final List<Book> books;

  CategoriesGrid({Key key, this.books}) : super(key: key);

  @override
  _CategoriesGridState createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesBloc>(context).add(GetCategoryItemsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is NoBooksInCategory) {
          return Container();
        } else if (state is DidGetCategoryItems) {
          return _categoriesGrid(state.categoryItems);
        } else if (state is ShouldNavigateToConcreteCategory) {
          return _categoriesGrid(state.currentCategoryItems);
        }
        return Center(
          child: CupertinoActivityIndicator(radius: 20),
        );
      },
      listener: (_, state) {
        if (state is ShouldNavigateToConcreteCategory) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookList(
                      books: state.books, category: state.category))).then((_) {
            BlocProvider.of<CategoriesBloc>(context)
                .add(GetCategoryItemsRequested());
          });
        }
      },
    );
  }

  Widget _categoriesGrid(List<CategoryItem> categoryItems) {
    final tileSize = (MediaQuery.of(context).size.width / 2) - 20;

    return Center(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: categoryItems
                  .map((item) => InkWell(
                        onTap: () {
                          BlocProvider.of<CategoriesBloc>(context).add(
                              NavigateToConcreteCategoryRequested(
                                  category: item.category));
                        },
                        child: CategoryItemTile(
                          categoryItem: item,
                          width: tileSize,
                          height: tileSize,
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
