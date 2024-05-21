import 'package:flutter/material.dart';
import 'package:meals/data.dart/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  //onSelect method
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
    // Navigator.push(context, route);
  }

  @override
  Widget build(context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: const Text(
          'Pick Your Category as per choice See the changes  ',
        ),
      ),
      //
      body: GridView(
        padding: const EdgeInsets.all(18),
        //
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        //
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(
                context,
                category,
              ),
            ),
        ],
      ),
    );
  }
}
