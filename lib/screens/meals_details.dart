import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/meal.dart';

class MealsDetailsScreen extends StatelessWidget {
  Meal meals;
  final void Function(Meal meal) onToggleFavorite;
  MealsDetailsScreen({
    Key? key,
    required this.meals,
    required this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavorite(meals);
              },
              icon: const Icon(
                Icons.star,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meals.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 250,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Ingredients".toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredients in meals.ingredients)
              Text(
                ingredients,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.00, vertical: 7.00),
              child: Text(
                "steps".toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final steps in meals.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.00, vertical: 7.00),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
