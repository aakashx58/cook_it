import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category.dart';
import '../services/api_service.dart';

final categoryListLoading = StateProvider<bool>(
  (ref) => true,
);

final categoryListError = StateProvider<String?>(
  (ref) => null,
);

final categoryListProvider =
    StateNotifierProvider<CategoryListNotifier, List<Category>>(
        (ref) => CategoryListNotifier(ref));

class CategoryListNotifier extends StateNotifier<List<Category>> {
  var _isInit = true;
  final Ref _ref;
  CategoryListNotifier(this._ref) : super([]);

  Future<void> fetchCategoryList({again = false}) async {
    if (_isInit || again) {
      var isLoading = _ref.read(categoryListLoading.notifier);
      var error = _ref.read(categoryListError.notifier);
      try {
        isLoading.state = true;
        final categoryList = await ApiService.fetchAllCategoriesFromAPI();
        state = categoryList;
        error.state =
            null; // In case if user is trying again after encountring error
        isLoading.state = false;
        _isInit = false;
      } catch (e) {
        error.state = e.toString();
        isLoading.state = false;
        _isInit = false;
      }
    }
  }
}
