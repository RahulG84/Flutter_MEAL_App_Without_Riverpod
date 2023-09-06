import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifiers) onSelectedScreen;
  const MainDrawer({Key? key, required this.onSelectedScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(10.00),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primary.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.fastfood,
                  size: 40.00,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(
                  width: 20.00,
                ),
                Text(
                  'Cooking Up!..',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectedScreen('meals');
            },
            leading: Icon(
              Icons.restaurant,
              size: 22,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 22,
                  ),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 2.00,
            indent: 5.00,
            endIndent: 5.00,
          ),
          ListTile(
            onTap: () {
              onSelectedScreen('filters');
            },
            leading: Icon(
              Icons.filter_alt,
              size: 22,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 22,
                  ),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 2.00,
            indent: 5.00,
            endIndent: 5.00,
          ),
          ListTile(
            onTap: () {

            },
            leading: Icon(
              Icons.settings,
              size: 22,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Setting',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 22,
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 2.00,
            indent: 5.00,
            endIndent: 5.00,
          ),
        ],
      ),
    );
  }
}
