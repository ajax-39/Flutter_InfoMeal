import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/meals_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
    // required this.onToggleFavorite,
  });

  final Meal meal;
  // final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final bool isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      //
      appBar: AppBar(
        title: Text(meal.title),
        //
        actions: [
          IconButton(
            onPressed: () {
              // onToggleFavorite(meal);
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              //
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      wasAdded ? 'Meal added as a favorite' : 'Meal Removed'),
                  duration: const Duration(seconds: 4),
                ),
              );
            },
            //
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              //
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
              //
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween(
                  begin: 0.8,
                  end: 1.0,
                ).animate(animation),
                //
                child: child,
              ),
            ),
          )
        ],
      ),
      //
      body: SingleChildScrollView(
        child: Column(
          //
          children: [
            //
            Hero(
              tag: meal.id,
              //
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            //
            const SizedBox(
              height: 14,
            ),
            //
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            //
            const SizedBox(
              height: 14,
            ),
            //
            for (final ingredient in meal.ingredients)
              Text(
                textAlign: TextAlign.start,
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            //
            const SizedBox(
              height: 24,
            ),
            //
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            //
            const SizedBox(
              height: 14,
            ),
            //
            for (final ingredient in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  textAlign: TextAlign.center,
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            //
          ],
        ),
      ),
    );
  }
}
