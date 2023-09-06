import 'package:flutter/material.dart';
import 'package:udemy_meals_app/data/dummy_data.dart';
import 'package:udemy_meals_app/models/meal.dart';
import 'package:udemy_meals_app/screens/catergories.dart';
import 'package:udemy_meals_app/screens/filters.dart';
import 'package:udemy_meals_app/screens/meals.dart';
import 'package:udemy_meals_app/widget/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  final List<Meal> favoritesMeals = [];
  Map<Filter, bool> selectedFilters = kInitialFilters;

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void toggleFavoritesMealStatus(Meal meal) {
    final isExisting = favoritesMeals.contains(meal);
    if (isExisting) {
      setState(
        () {
          favoritesMeals.remove(meal);
        },
      );
      showInfoMessage('This Favorites Meal Is No Longer...');
    } else {
      setState(
        () {
          favoritesMeals.add(meal);
        },
      );
      showInfoMessage('Added This As a Favorites Meal...');
    }
  }

  void onSetScreen(String identifiers) async {
    Navigator.pop(context);
    if (identifiers == 'filters') {
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (context) => FiltersScreen(currentFilters: selectedFilters),
        ),
      );
      setState(() {
        selectedFilters = result ?? kInitialFilters;
      });
    } else {
      // Navigator.pop(context);
    }
  }

  void selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    //
    Widget activePage = CategoriesScreen(
      onToggleFavorite: toggleFavoritesMealStatus,
      availableMeals: availableMeals,
    );

    var activePageTitle = 'Categories';

    if (selectedIndex == 1) {
      activePage = MealsScreen(
        meal: favoritesMeals,
        onToggleFavorite: toggleFavoritesMealStatus,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectedScreen: onSetScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        onTap: selectedPage,
        currentIndex: selectedIndex,
        selectedIconTheme: const IconThemeData(color: Colors.amberAccent),
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white,

        // unselectedLabelStyle:const TextStyle(
        //   color: Colors.white,
        // ),
      ),
    );
  }
}
