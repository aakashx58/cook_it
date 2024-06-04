import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMeal = ModalRoute.of(context)!.settings.arguments as Meal;
    final mediaQuery = MediaQuery.of(context);
    debugPrint('Selected Meal: $selectedMeal');
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                FadeInImage.assetNetwork(
                  width: mediaQuery.size.width,
                  fit: BoxFit.contain,
                  placeholder: 'assets/images/meal_placeholder.jpg',
                  image: selectedMeal.thumbnailURL,
                  imageErrorBuilder: (context, error, stackTrace) {
                    debugPrint('Image Loading Error: $error');
                    return Image.asset('assets/images/meal_placeholder.jpg');
                  },
                ),
                Container(
                  height: mediaQuery.size.width + 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Theme.of(context).colorScheme.background
                      ],
                      stops: const [.5, 1],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 80,
              child: Center(
                child: Text(
                  'Ingredients',
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            for (var i = 0; i < selectedMeal.ingredients.length; i++)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: mediaQuery.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedMeal.ingredients[i]),
                    Text(selectedMeal.measurements[i])
                  ],
                ),
              ),
            const SizedBox(
              height: 80,
              child: Center(
                child: Text(
                  'Instructions',
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                textAlign: TextAlign.justify,
                selectedMeal.instructions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
