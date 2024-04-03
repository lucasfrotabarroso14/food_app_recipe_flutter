
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../data/dummy_data.dart';

import '../models/category.dart';
import '../models/meals.dart';
import '../widgets/category_grid_item.dart';
import 'meals_screen.dart';



//pagina dos quadrados onde tem as categorias (pagina inicial) pag 01
class CategoriesScreen extends StatelessWidget{

  final List<Meal> availableMeals;

  const CategoriesScreen({super.key, required this.availableMeals});


  // final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context){
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20

      ),



      children: [
        for(final category in  availableCategories)
          CategoryGridItem(
            category : category,
            onSelectCategory:(){
              _selectCategory(context,category);
              },

          )
      ],

    );
  }



  void _selectCategory(BuildContext context, Category category){

    final filteredMeals = availableMeals.where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeals ,
          )
      )
    );


  }


}
