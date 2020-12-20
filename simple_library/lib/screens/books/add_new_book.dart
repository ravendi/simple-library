import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simplelibrary/constants/app_colors.dart';
import 'package:simplelibrary/custom_widgets/simple_library_text.dart';
import 'package:simplelibrary/model/book.dart';
import 'package:simplelibrary/model/category.dart';

class AddNewBook extends StatelessWidget {
  final Category category;
  final Function(Book) onAddNewBookPressed;
  final TextEditingController _textEditingController = TextEditingController();

  AddNewBook({Key key, @required this.category, this.onAddNewBookPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.separator,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _button(
                    title: 'cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                _button(
                    title: 'add',
                    onPressed: () {
                      Navigator.of(context).pop();
                      onAddNewBookPressed(Book(
                          name: _textEditingController.text,
                          categories: [category]));
                    })
              ],
            ),
            SizedBox(height: 70),
            TextFormField(
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: 'Name of the book...', hintStyle: _textStyle),
              style: _textStyle,
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget _button({String title, Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: onPressed,
        child: SimpleLibraryText(
          text: title,
          color: AppColors.primaryText,
          fontSize: 22,
        ),
      ),
    );
  }

  TextStyle get _textStyle => TextStyle(
        fontSize: 18,
        color: AppColors.secondaryText,
        fontFamily: 'Satisfy',
      );
}
