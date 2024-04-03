
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/pages/categories_screen.dart';
import 'package:food_app/pages/filters.dart';
import 'package:food_app/providers/favorites_provider.dart';
import 'package:food_app/providers/meals_provider.dart';
import 'package:food_app/widgets/main_drawer.dart';

import '../providers/filter_provider.dart';
import 'meals_screen.dart';




class TabsScreen extends ConsumerStatefulWidget {


  const TabsScreen({super.key});



  @override
  ConsumerState<ConsumerStatefulWidget> createState() {

    return _TabScreenState();
  }


}

class _TabScreenState extends ConsumerState<TabsScreen>{

  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier =='filters'){
      await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(builder: (ctx) => FilterScreen()
        )
      );
    }


  }

  @override
  Widget build(BuildContext context){

    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1 ){
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals
      );
      activePageTitle = 'Your Favorites';
    }



    return Scaffold(

      appBar:AppBar(title: Text(activePageTitle),

      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label:'Favorites'),
        ],
      ),
    );

  }


}




