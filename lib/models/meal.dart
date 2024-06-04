class Meal {
  final String id;
  final String name;
  final String category;
  final String thumbnailURL;
  final List<String> ingredients;
  final List<String> measurements;
  final String instructions;

  const Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.thumbnailURL,
    required this.ingredients,
    required this.measurements,
    required this.instructions,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    final strIngredients = <String>[];
    final strMeasurements = <String>[];

    for (var ingredientIndex = 1; true; ingredientIndex++) {
      var ingredient = json['strIngredient$ingredientIndex'] as String?;
      if (ingredient == null || ingredient.isEmpty) {
        // Break the loop if no more ingredients are encountered
        break;
      }
      strIngredients.add(ingredient);
    }
    for (var measurementIndex = 1; true; measurementIndex++) {
      var measurement = json['strMeasure$measurementIndex'] as String?;
      if (measurement == null || measurement.isEmpty) {
        // Break the loop if no more measurements are encountered
        break;
      }
      strMeasurements.add(measurement);
    }

    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      thumbnailURL: json['strMealThumb'],
      ingredients: strIngredients,
      measurements: strMeasurements,
      instructions: json['strInstructions'],
    );
  }
}
