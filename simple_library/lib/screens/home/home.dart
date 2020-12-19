import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplelibrary/constants/app_colors.dart';
import 'package:simplelibrary/custom_widgets/simple_library_text.dart';
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
      appBar: AppBar(
        backgroundColor: AppColors.separator,
        title: SimpleLibraryText(
          text: 'Categories',
          fontSize: 23,
          color: AppColors.mainText,
        ),
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is DidGetBooks) {
            return BlocProvider(create: (context) => CategoriesBloc(books: state.allBooks), child: CategoriesGrid(books: state.allBooks));
          } else if (state is DidAddBook) {
            return BlocProvider(create: (context) => CategoriesBloc(books: state.allBooks), child: CategoriesGrid(books: state.allBooks));
          } else if (state is DidRemoveBook) {
            return BlocProvider(create: (context) => CategoriesBloc(books: state.allBooks), child: CategoriesGrid(books: state.allBooks));
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
