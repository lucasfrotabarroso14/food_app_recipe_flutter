


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/widgets/meal_especific_line.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meals.dart';


//


class MealItem extends StatelessWidget{

  const MealItem({super.key,required this.meal, required this.onSelectMeal});

  final Meal meal;

  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context){
    return Card(
      child: InkWell(
        onTap: (){
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,

            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,

                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20 ,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealEspecificLine(label:'${meal.duration} min' , icon: Icons.schedule),
                        const SizedBox(width: 12,),
                        MealEspecificLine(label:complexityText , icon: Icons.work),
                        const SizedBox(width: 12,),
                        MealEspecificLine(label:affordabilityText , icon: Icons.work),
                        const SizedBox(width: 12,),

                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )

    );
  }
}
