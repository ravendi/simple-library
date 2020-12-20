import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplelibrary/custom_widgets/simple_library_app_bar.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/screens/home/categories/bloc/bloc.dart';
import 'package:simplelibrary/screens/home/categories/categories_grid.dart';
import 'package:simplelibrary/screens/main_bloc/bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context).add(GetBooksRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleLibraryAppBar(
        title: 'Categories',
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is DidGetBooks) {
            return _categoriesBlocProvider(state.allBooks);
          } else if (state is DidAddBook) {
            return _categoriesBlocProvider(state.allBooks);
          } else if (state is DidRemoveBook) {
            return _categoriesBlocProvider(state.allBooks);
          } else {
            return Center(
                child: CupertinoActivityIndicator(radius: 20)
            );
          }
        },
      ),
    );
  }

  Widget _categoriesBlocProvider(List<Book> books) {
    return BlocProvider(create: (context) => CategoriesBloc(books: books), child: CategoriesGrid(books: books));
  }
}
