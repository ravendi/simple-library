import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplelibrary/constants/app_colors.dart';
import 'package:simplelibrary/custom_widgets/simple_library_app_bar.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';
import 'package:simplelibrary/screens/books/add_new_book.dart';
import 'package:simplelibrary/screens/books/bloc/bloc.dart';
import 'package:simplelibrary/screens/books/book_list_element.dart';
import 'package:simplelibrary/screens/books/remove_book_dialog.dart';
import 'package:simplelibrary/screens/main_bloc/bloc.dart';
import 'package:simplelibrary/screens/main_bloc/main_bloc.dart';

class BookList extends StatefulWidget {
  List<Book> books;
  Category category;

  BookList({Key key, @required this.books, @required this.category})
      : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleLibraryAppBar(title: widget.category.name),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.separator,
        child: Icon(Icons.add),
        onPressed: () {
          BlocProvider.of<BookListBloc>(context)
              .add(DidPressAddNewBook(category: widget.category));
        },
      ),
      body: BlocConsumer<MainBloc, MainState>(
        listener: (_, state) {
          if (state is DidAddBook) {
            BlocProvider.of<BookListBloc>(context).add(
                ReloadBooksInCurrentCategoryRequested(
                    category: widget.category, allBooks: state.allBooks));
          } else if (state is DidRemoveBook) {
            BlocProvider.of<BookListBloc>(context).add(
                ReloadBooksInCurrentCategoryRequested(
                    category: widget.category, allBooks: state.allBooks));
          }
        },
        builder: (_, state) {
          return BlocConsumer<BookListBloc, BookListState>(
            builder: (_, state) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(25, 30, 15, 0),
                child: _list(widget.books),
              );
            },
            listener: (ctx, state) {
              if (state is BooksLoaded) {
                widget.books = state.books;
              } else if (state is ShouldShowAddNewBookBottomSheet) {
                _showAddNewBookBottomSheet(ctx);
              } else if (state is ShouldShowRemoveDialog) {
                _showRemoveBookDialog(ctx, state.book);
              }
            },
          );
        },
      ),
    );
  }

  Widget _list(List<Book> books) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: books
            .map((element) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BookListElement(
                      book: element,
                      onRemoveInitiated: (book) {
                        BlocProvider.of<BookListBloc>(context)
                            .add(RemoveBookInitiated(book));
                      }),
                ))
            .toList(),
      ),
    );
  }

  void _showAddNewBookBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(
                  top: 15, bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddNewBook(
                  category: widget.category,
                  onAddNewBookPressed: (book) {
                    BlocProvider.of<MainBloc>(ctx)
                        .add(AddBookRequested(book: book));
                  }),
            ),
          );
        });
  }

  void _showRemoveBookDialog(BuildContext ctx, Book book) {
    showDialog(
        context: context,
        child: RemoveBookDialog(
            title: 'Do you want to remove this book from your Library?',
            onContinuePressed: () {
              BlocProvider.of<MainBloc>(ctx).add(RemoveBookRequested(book: book));
            }));
  }
}
