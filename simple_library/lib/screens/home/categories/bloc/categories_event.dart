import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/category.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

class GetCategoryItemsRequested extends CategoriesEvent {
  const GetCategoryItemsRequested();

  @override
  List<Object> get props => [];
}

class NavigateToConcreteCategoryRequested extends CategoriesEvent {
  final Category category;

  NavigateToConcreteCategoryRequested({@required this.category});

  @override
  List<Object> get props => [category];
}