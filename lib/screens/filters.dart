import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum Filter {
//   glutenFree,
//   lactoseFree,
//   vegetarian,
// }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilter,
  });

  // final Map<Filter, bool> currentFilter;

  @override
  Widget build(context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      //
      drawer: MainDrawer(onSelectScreen: (indentifier) {
        Navigator.of(context).pop();

        if (indentifier == 'meals') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const TabScreen(),
            ),
          );
        }
      }),
      //
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      //
      // body: PopScope(
      //   canPop: false,
      //   onPopInvoked: (bool didPop) {
      //     if (didPop) return;
      //     ref.read(filtersProvider.notifier).setFilters(
      //       {
      //         Filter.glutenFree: _glutenFreeFilterSet,
      //         Filter.lactoseFree: _lactoseFreeFilterSet,
      //         Filter.vegetarian: _veganFreeFilterSet,
      //       },
      //     );

      // Navigator.of(context).pop(
      //   {
      //     Filter.glutenFree: _glutenFreeFilterSet,
      //     Filter.lactoseFree: _lactoseFreeFilterSet,
      //     Filter.vegetarian: _veganFreeFilterSet,
      //   },
      // );
      // },
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            //
            onChanged: (isChecked) {
              // setState(() {
              //   _glutenFreeFilterSet = isChecked;
              // });
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            //
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            //
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            //
            activeColor: Theme.of(context).colorScheme.tertiary,
            //
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
          //
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            //
            onChanged: (isChecked) {
              // setState(() {
              //   _lactoseFreeFilterSet = isChecked;
              // });
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            //
            title: Text(
              'Lactose-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            //
            subtitle: Text(
              'Only include Lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            //
            activeColor: Theme.of(context).colorScheme.tertiary,
            //
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
          //
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            //
            onChanged: (isChecked) {
              // setState(() {
              //   _veganFreeFilterSet = isChecked;
              // });

              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            //
            title: Text(
              'Vegatarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            //
            subtitle: Text(
              'Only include Vegatarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            //
            activeColor: Theme.of(context).colorScheme.tertiary,
            //
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
        ],
      ),
    );
  }
}
