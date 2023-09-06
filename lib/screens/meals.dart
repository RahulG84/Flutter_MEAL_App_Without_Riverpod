import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/meal.dart';
import 'package:udemy_meals_app/screens/meals_details.dart';
import 'package:udemy_meals_app/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meal;
  final void Function(Meal meal) onToggleFavorite;

  const MealsScreen({
    Key? key,
    this.title,
    required this.meal,
    required this.onToggleFavorite,
  }) : super(key: key);

  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsDetailsScreen(
          meals: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    Widget content = ListView.builder(
      itemCount: meal.length,
      itemBuilder: (context, index) {
        final item = meal[index];
        return MealItem(
          meal: item,
          onSelectedMeal: (meal) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MealsDetailsScreen(
                  meals: meal,
                  onToggleFavorite: onToggleFavorite,
                ),
              ),
            );
          },
        );
      },
    );

    if (meal.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Uh ohh.... nothing here!",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Try Different Category...",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    }
    if (title == null) {
      return content;
      // after returning the remaining code will not be excuited
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
