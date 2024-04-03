

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meals.dart';
import '../providers/favorites_provider.dart';

// quando clico na comida abre essa pagina que e o detalhe da comida -pag 03

class MealDetailScreen extends ConsumerWidget{

  MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: (){
                final wasAdded = ref.read(favoriteMealsProvider.notifier)
                    .alternarStatusFavoritoRefeicao(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(wasAdded? 'Meal added as a favorite': 'Meal removed'),
                    ),
                );

              },
              icon: Icon(isFavorite? Icons.star: Icons.star_border))
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              fit : BoxFit.cover,
              height: 300,
              width: double.infinity,

            ),
            const SizedBox(height: 15,),
            for(final ingredient in meal.ingredients)
              Text(ingredient,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).colorScheme.onBackground)
              ),
            const SizedBox(height: 24,),
            for(final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)
                ),
              ),

          ],
        ),
      )
    );

  }





}