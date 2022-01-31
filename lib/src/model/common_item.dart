import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/src/model/i_common_item.dart';

class CommonItem with ICommonItem {
  @override
  final Icon? icon;
  @override
  final ImageProvider? image;
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? description;
  @override
  final String? imageSrc;

  CommonItem({
    this.icon,
    this.image,
    this.title,
    this.subtitle,
    this.description,
    this.imageSrc,
  });
}
