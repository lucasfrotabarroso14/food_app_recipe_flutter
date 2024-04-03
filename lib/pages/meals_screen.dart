
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';
import 'meals_detail_screen.dart';

class MealsScreen extends StatelessWidget{

  const  MealsScreen({super.key,  this.title, required this.meals,
  });

  final String? title;
  final List<Meal> meals;


// quando clica na categoria abre essa pagina com as comidas - pag 02

  void selectMeal(BuildContext context,Meal meal){


    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailScreen(
          meal: meal,

          )
        )
    );


  }


  @override
  Widget build(BuildContext context) {

    Widget content =   ListView.builder(

      itemCount: meals.length,

      itemBuilder: (ctx,index) => MealItem(
        meal: meals[index],
        onSelectMeal: (meal){
          selectMeal(context, meal);
        },
      ),
    );

    if (meals.isEmpty){
      content = Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('uh oh ... nothing here', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color:Theme.of(context).colorScheme.onBackground
          )
          ),
          const SizedBox(height: 16,),
          Text(
            'try selecting a different Category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color:Theme.of(context).colorScheme.onBackground
            ),
          ),

        ],
      ),
      );
    }

    if (title == null){
      return content;
    }


    return Scaffold(
        appBar: AppBar(
          title: Text(title! ),
        ),
        body: content

    );


  }
}