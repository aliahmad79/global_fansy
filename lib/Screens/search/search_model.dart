import 'package:flutter/cupertino.dart';

class SearchModel {
  String? image;
  String? name;
  String? description;
  String? text;
  VoidCallback? onPress;
  IconData? icon;
  Color? color;

  SearchModel({
    this.image,
    this.name,
    this.description,
    this.text,
    this.onPress,
    this.icon,
    this.color,
  });
}
