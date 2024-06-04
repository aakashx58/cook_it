import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './utils/app_theme.dart';
import './views/main_screen.dart';
import './views/meal_detail_screen.dart';
import './views/meals_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.appTheme(),
      darkTheme: CustomTheme.appTheme(isDark: true),
      title: "Cookit",
      home: const MainScreen(),
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        MealsScreen.routeName: (context) => const MealsScreen(),
      },
    );
  }
}
