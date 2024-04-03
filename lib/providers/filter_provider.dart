

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/providers/meals_provider.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}



//o statenotifier é uma solucao para controlar o estado de forma imutavel
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {

  FiltersNotifier() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false
  });



  void setFilters(Map<Filter,bool> chosenFilters){
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive){
    state = {
      ...state,
      filter: isActive
    };
  }


}

//-------------------------------------------------------


final filtersProvider = StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>(
      (ref) => FiltersNotifier(),
);


//-------------------------------------------------------


// funcao que faz o filtro
final filteredMealsProvider = Provider((ref){

    final meals = ref.watch(mealsProvider); //retorna todas as refeicoes
    final activeFilters = ref.watch(filtersProvider);// retorna um map com os filtros para ser aplicado


    //A condição completa verifica se o filtro glutenFree está ativo e se a refeição atual não é livre de
    // glúten. Se ambas as condições forem verdadeiras, a expressão retorna false, indicando que a refeição
    // atual não deve ser incluída na lista filtrada.


    return meals.where((meal){
      if(activeFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        // ele vai em cada meal e ver se a propriedade isglutenfree é false se for ele remove da lista
        return false;
      }
      if(activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(activeFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
  });



