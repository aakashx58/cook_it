import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../../views/meal_detail_screen.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.meal,
  });

  final Meal meal;
  final lightColor = Colors.white;
  final darkColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(MealDetailScreen.routeName, arguments: meal),
      child: Container(
        height: 180, // Will be ignored if used in Gridview
        width: 180, // Will be ignored if used in Gridview
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.brightness == Brightness.light
              ? lightColor
              : darkColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                border: Border.all(
                    color: Theme.of(context).colorScheme.brightness ==
                            Brightness.light
                        ? lightColor
                        : darkColor,
                    width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.contain,
                  placeholder: 'assets/images/meal_placeholder.jpg',
                  image: meal.thumbnailURL,
                  imageErrorBuilder: (context, error, stackTrace) {
                    debugPrint('Image Loading Error: $error');
                    return Image.asset('assets/images/meal_placeholder.jpg');
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 50,
                width: 500,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.brightness ==
                          Brightness.light
                      ? lightColor.withOpacity(.75)
                      : darkColor.withOpacity(.75),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.brightness ==
                              Brightness.light
                          ? lightColor
                          : darkColor,
                      width: 0),
                ),
                child: Center(
                  child: Text(meal.name),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
