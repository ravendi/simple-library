import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplelibrary/screens/home/categories/categories_grid.dart';
import 'package:simplelibrary/screens/main_bloc/bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is DidGetBooks) {
            return CategoriesGrid(books: state.allBooks);
          } else if (state is DidAddBook) {
            return CategoriesGrid(books: state.allBooks);
          } else if (state is DidRemoveBook) {
            return CategoriesGrid(books: state.allBooks);
          } else {
            return Center(
                child: CupertinoActivityIndicator(radius: 20)
            );
          }
        },
      ),
    );
  }
}
