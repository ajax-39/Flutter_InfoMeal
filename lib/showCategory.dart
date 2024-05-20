import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class ShowCategory extends StatelessWidget {
  const ShowCategory({
    super.key,
    required this.showCat,
  });

  final Category showCat;

  @override
  Widget build(context) {
    return Container(
      height: 100,
      width: 100,
      //
      decoration: BoxDecoration(
        color: showCat.color,
      ),
      //
      child: Text(showCat.title),
    );
  }
}
