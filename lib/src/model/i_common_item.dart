import 'package:flutter/material.dart';

mixin ICommonItem {
  Icon? get icon;
  ImageProvider? get image;
  String? get title;
  String? get subtitle;
  String? get description;
  String? get imageSrc;
}