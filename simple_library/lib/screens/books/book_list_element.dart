import 'package:flutter/material.dart';
import 'package:simplelibrary/constants/app_colors.dart';
import 'package:simplelibrary/custom_widgets/simple_library_text.dart';
import 'package:simplelibrary/model/book.dart';

class BookListElement extends StatelessWidget {
  final Book book;
  final Function(Book) onRemoveInitiated;

  const BookListElement({Key key, @required this.book, this.onRemoveInitiated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        onRemoveInitiated(book);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SimpleLibraryText(
                    text: book.name,
                    color: AppColors.primaryText,
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onRemoveInitiated(book);
                  },
                  child: Icon(Icons.delete, color: AppColors.secondaryText),
                )
              ],
            ),
            SizedBox(height: 8),
            Container(
                height: 1, width: double.infinity, color: AppColors.separator)
          ],
        ),
      ),
    );
  }
}
