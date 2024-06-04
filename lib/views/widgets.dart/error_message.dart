import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;
  final Function({required bool again}) fetchCategory;
  final Function({required bool again}) fetchMeals;

  const ErrorMessage({
    required this.fetchCategory,
    required this.fetchMeals,
    required this.errorMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          TextButton(
              onPressed: () {
                fetchCategory(again: true);
                fetchMeals(again: true);
              },
              child: const Text('Try Again'))
        ],
      ),
    );
  }
}
