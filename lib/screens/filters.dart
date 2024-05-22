import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  Widget build(context) {
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
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop(
            {
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _veganFreeFilterSet,
            },
          );
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              //
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
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
              value: _lactoseFreeFilterSet,
              //
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
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
              value: _veganFreeFilterSet,
              //
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
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
      ),
    );
  }
}
