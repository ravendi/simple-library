import 'package:flutter/material.dart';
import 'package:simplelibrary/constants/app_colors.dart';
import 'package:simplelibrary/custom_widgets/simple_library_text.dart';

class SimpleLibraryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SimpleLibraryAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.separator,
      title: SimpleLibraryText(
        text: title,
        fontSize: 23,
        color: AppColors.mainText,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
