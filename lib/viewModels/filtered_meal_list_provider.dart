import 'package:cookit/viewModels/meal_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

final categoryFilterMealListProvider =
    StateNotifierProvider<CategoryFilterMealListNotifier, List<Meal>>(
        (ref) => CategoryFilterMealListNotifier(ref));

class CategoryFilterMealListNotifier extends StateNotifier<List<Meal>> {
  final Ref _ref;
  CategoryFilterMealListNotifier(this._ref) : super([]);

  void filterMealListByCategory(String category) {
    final mealList = _ref.watch(mealListProvider);
    state = mealList.where((meal) => meal.category == category).toList();
  }
}

final searchFilterMealListProvider =
    StateNotifierProvider<SearchFilterMealListNotifier, List<Meal>>(
        (ref) => SearchFilterMealListNotifier(ref));

class SearchFilterMealListNotifier extends StateNotifier<List<Meal>> {
  final Ref _ref;
  SearchFilterMealListNotifier(this._ref) : super([]);

  void filterMealListBySearch(String searchStr) {
    if (searchStr.isEmpty) {
      state = [];
    } else {
      final mealList = _ref.watch(mealListProvider);
      state = mealList
          .where((meal) =>
              meal.name.toLowerCase().contains(searchStr.toLowerCase()))
          .toList();
    }
  }
}
