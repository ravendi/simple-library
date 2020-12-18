import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;

  Category(this.name);

  @override
  List<Object> get props => [name];

  Category.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
    'name': name
  };
}
