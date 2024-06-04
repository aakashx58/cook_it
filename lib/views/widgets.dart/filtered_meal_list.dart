import 'package:flutter/material.dart';

import './meal_card.dart';
import '../../models/meal.dart';

class FilteredMealList extends StatelessWidget {
  final List<Meal> filteredMealList;
  const FilteredMealList(this.filteredMealList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: filteredMealList.isEmpty
          ? const Center(
              child: Text('Ops! No meal found.'),
            )
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .85,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 25),
              itemCount: filteredMealList.length,
              itemBuilder: (context, index) {
                return MealCard(meal: filteredMealList[index]);
              },
            ),
    );
  }
}
