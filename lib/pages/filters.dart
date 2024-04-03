
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {

  const FilterScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('your filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text('Gluten-free', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),
            ),
            subtitle: Text('Only include gluten-free meals.',
              style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ),
            ),
          ),

          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text('Lactose-free', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),
            ),
            subtitle: Text('Only include lactose-free meals.',
              style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ),
            ),
          ),
          SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              title: Text('Vegetarian', style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ),
              ),
              subtitle: Text('Only include vegetarian-free meals.',
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                ),
              ),
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              }),


          SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              title: Text('Vegan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              ),
              subtitle: Text('Only include vegan-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              }
          )

        ],
      ),
    );
  }
}
