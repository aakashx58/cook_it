import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewModels/category_list_provider.dart';
import '../viewModels/meal_list_provider.dart';
import './widgets.dart/home_tab.dart';
import './widgets.dart/error_message.dart';

class MainScreen extends ConsumerStatefulWidget {
  static const routeName = '/category-screen';

  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        ref.read(categoryListProvider.notifier).fetchCategoryList();
        ref.read(mealListProvider.notifier).fetchMealList();
      },
    );
    super.initState();
  }

  Widget scaffoldBody() {
    final isLoading =
        ref.watch(categoryListLoading) || ref.watch(mealListLoading);
    final error = ref.watch(categoryListError) ?? ref.watch(mealListError);
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (error != null) {
      return ErrorMessage(
        fetchCategory:
            ref.read(categoryListProvider.notifier).fetchCategoryList,
        fetchMeals: ref.read(mealListProvider.notifier).fetchMealList,
        errorMessage: error,
      );
    } else {
      return const HomeTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isDarkMode = mediaQuery.platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          isDarkMode
              ? 'assets/icons/icon_light.png'
              : 'assets/icons/icon_dark.png',
          height: 35,
          width: 35,
        ),
        centerTitle: true,
      ),
      body: scaffoldBody(),
    );
  }
}
