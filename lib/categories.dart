import 'package:flutter/material.dart';
import 'package:meals/data.dart/dummy_data.dart';
import 'package:meals/showCategory.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: const Text(
          'Pick Your Category',
        ),
      ),
      //
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...availableCategories.map((e) => ShowCategory(showCat: e)),
        ],
      ),
    );
  }
}
