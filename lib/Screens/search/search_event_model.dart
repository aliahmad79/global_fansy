import 'package:flutter/cupertino.dart';

class SearchEventsModel {
  String? image;
  String? avatarImage;
  String? name;
  String? profession;
  String? city;
  IconData? icon;

  SearchEventsModel(
      {this.image,
      this.name,
      this.icon,
      this.avatarImage,
      this.city,
      this.profession});
}
