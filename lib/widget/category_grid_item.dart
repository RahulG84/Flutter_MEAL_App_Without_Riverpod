import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/catergory.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final void Function() onPressSelectedCategory;

  const CategoryGridItem(
      {Key? key, required this.category, required this.onPressSelectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressSelectedCategory,
      splashColor: Theme.of(context).highlightColor,
      borderRadius: BorderRadius.circular(200),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.6),
              category.color.withOpacity(0.9), // target opacity
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    //onBackground --> Give me the color that's suitable for showing content on top of the background
                  ),
            ),
            Text(
              category.id,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    //onBackground --> Give me the color that's suitable for showing content on top of the background
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
