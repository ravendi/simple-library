import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/model/category.dart';

class Book extends Equatable {
  final String name;
  final List<Category> categories;

  Book({@required this.name, @required this.categories});

  @override
  List<Object> get props => [name];

  Book.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        categories = json['categories'] != null
            ? List<Category>.from(
                json['categories'].map((el) => Category.fromJson(el)))
            : null;

  Map<String, dynamic> toJson() => {
    'name': name,
    'categories': categories?.map((el) => el.toJson())
  };
}
