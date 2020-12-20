import 'package:flutter/material.dart';
import 'package:simplelibrary/constants/app_colors.dart';
import 'package:simplelibrary/custom_widgets/simple_library_text.dart';

class RemoveBookDialog extends StatelessWidget {
  final String title;
  final Function onContinuePressed;

  const RemoveBookDialog({Key key, this.onContinuePressed, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.separator,
      title: SimpleLibraryText(
        text: title,
        color: AppColors.primaryText,
        fontSize: 20,
      ),
      actions: <Widget>[
        FlatButton(
          child: SimpleLibraryText(
            text: 'REMOVE',
            color: Colors.redAccent,
            fontSize: 16,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onContinuePressed();
          },
        ),
        FlatButton(
          child: SimpleLibraryText(
            text: 'CANCEL',
            color: AppColors.secondaryText,
            fontSize: 16,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
