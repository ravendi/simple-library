import 'package:flutter/material.dart';
import 'package:simplelibrary/constants/app_colors.dart';
import 'package:simplelibrary/custom_widgets/simple_library_text.dart';
import 'package:simplelibrary/screens/home/categories/category_item.dart';

class CategoryItemTile extends StatelessWidget {
  final double width;
  final double height;
  final CategoryItem categoryItem;

  const CategoryItemTile(
      {Key key, this.width, this.height, @required this.categoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColors.categoryTileBackground,
          border: Border.all(color: AppColors.separator)),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 15, top: 15),
              child: SimpleLibraryText(
                text: categoryItem.countInfo,
                color: AppColors.secondaryText,
                fontSize: 20,
              ),
            ),
          ),
          Spacer(),
          SimpleLibraryText(
            text: categoryItem.category.name,
            color: AppColors.primaryText,
            fontSize: 24,
          ),
          SizedBox(height: 15)
        ],
      ),
    );
  }
}
