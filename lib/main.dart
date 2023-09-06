import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_meals_app/data/dummy_data.dart';
import 'package:udemy_meals_app/screens/catergories.dart';
import 'package:udemy_meals_app/screens/meals.dart';
import 'package:udemy_meals_app/screens/tabs.dart';

void main() {
  runApp(const MyApp());
}

final appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
    //Alpha, Red, Green and Blue channel
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      // home: const CategoriesScreen(),
      home: const TabsScreen(),
      // const MealsScreen(
      //   title: "Some Category..",
      //   meal: dummyMeals,
      // ),
    );
  }
}