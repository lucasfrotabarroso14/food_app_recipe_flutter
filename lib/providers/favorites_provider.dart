
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meals.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {


  FavoriteMealsNotifier(): super( [] );

  bool alternarStatusFavoritoRefeicao(Meal meal){

    final MealIsFavorite = state.contains(meal);
    if (MealIsFavorite){
      // se a refeicao ja esta na lista ela emostra todas todos os outros meal da lista
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }else{
      // se nao esta na lista ele adiciona
      state = [...state,meal];
      return true;
    }


  }



}

final favoriteMealsProvider= StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});


