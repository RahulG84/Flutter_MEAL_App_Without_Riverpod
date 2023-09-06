import 'package:flutter/material.dart';
import 'package:udemy_meals_app/data/dummy_data.dart';
import 'package:udemy_meals_app/models/catergory.dart';
import 'package:udemy_meals_app/models/meal.dart';
import 'package:udemy_meals_app/screens/meals.dart';
import 'package:udemy_meals_app/widget/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  const CategoriesScreen({
    Key? key,
    required this.onToggleFavorite,
    required this.availableMeals,
  }) : super(key: key);

  void selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((element) => element.categories.contains(category.id))
        .toList();

    // final filteredMeals = dummyMeals
    //     .where((element) => element.categories.contains(category.id))
    //     .toList();
    // .where() --> its a Iterable List like Map or ListView
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meal: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20.00),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20.00,
        mainAxisSpacing: 20.00,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onPressSelectedCategory: () {
              selectCategory(context, category);
            },
          )
      ],
    );
  }
}
