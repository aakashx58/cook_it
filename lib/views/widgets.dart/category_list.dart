import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../meals_screen.dart';
import '../../models/category.dart';
import '../../viewModels/filtered_meal_list_provider.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({
    super.key,
    required this.categoryList,
  });

  final List<Category> categoryList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length + 1,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              if (index != 0) {
                ref
                    .read(categoryFilterMealListProvider.notifier)
                    .filterMealListByCategory(categoryList[index - 1].name);
              }
              Navigator.of(context).pushNamed(MealsScreen.routeName,
                  arguments: index == 0 ? null : categoryList[index - 1].name);
            },
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.brightness ==
                        Brightness.light
                    ? Colors.white
                    : Colors
                        .black, // Used the context of the build fn as ListView's context was causing a problem (The CategoryList widget would not rebuild on theme change)
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              child: Center(
                child: FittedBox(
                  child: Text(
                      index == 0 ? 'All Meals' : categoryList[index - 1].name),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
