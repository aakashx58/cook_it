import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewModels/category_list_provider.dart';
import '../../viewModels/meal_list_provider.dart';
import '../../viewModels/filtered_meal_list_provider.dart';
import '../meals_screen.dart';
import './meal_card.dart';
import './category_list.dart';
import './filtered_meal_list.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});
  @override
  ConsumerState<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  var searchText = '';

  @override
  Widget build(BuildContext context) {
    final searchFilteredMealListProvider =
        ref.watch(searchFilterMealListProvider);
    final searchFilteredMealListNotifier =
        ref.read(searchFilterMealListProvider.notifier);
    final appTheme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                errorBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                filled: true,
                fillColor: appTheme.colorScheme.primary.withAlpha(50),
                prefixIcon: Icon(
                  Icons.search,
                  color: appTheme.colorScheme.onBackground.withAlpha(200),
                ),
                hintText: 'Search',
              ),
              onChanged: (value) {
                searchText = value;
                searchFilteredMealListNotifier.filterMealListBySearch(value);
              },
            ),
            if (searchFilteredMealListProvider.isNotEmpty)
              FilteredMealList(searchFilteredMealListProvider)
            else if (searchText.isNotEmpty)
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Ops! Nothing Found.'))
            else if (searchFilteredMealListProvider.isEmpty)
              const StaticColumn(),
          ],
        ),
      ),
    );
  }
}

class StaticColumn extends ConsumerWidget {
  const StaticColumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(categoryListProvider);
    final randomMealList = ref.watch(randomMealListProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, bottom: 10),
          child: Text(
            'Categories',
            textScaleFactor: 1.5,
          ),
        ),
        CategoryList(categoryList: categoryList),
        const Padding(
          padding: EdgeInsets.only(top: 30, bottom: 10),
          child: Text(
            'Suggested Meals',
            textScaleFactor: 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25,
            ),
            children: [
              MealCard(meal: randomMealList[0]),
              MealCard(meal: randomMealList[1]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'All Meals',
                textScaleFactor: 1.5,
              ),
              IconButton(
                style:
                    IconButton.styleFrom(splashFactory: NoSplash.splashFactory),
                onPressed: () =>
                    Navigator.of(context).pushNamed(MealsScreen.routeName),
                icon: const Icon(Icons.arrow_right_alt_rounded),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25,
            ),
            children: [
              MealCard(meal: randomMealList[2]),
              MealCard(meal: randomMealList[3]),
              MealCard(meal: randomMealList[4]),
              MealCard(meal: randomMealList[5]),
            ],
          ),
        ),
      ],
    );
  }
}
