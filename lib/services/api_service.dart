import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/meal.dart';
import '../utils/custom_exception.dart';

class ApiService {
  static Future<List<Meal>> fetchAllMealsFromAPI() async {
    try {
      final url =
          Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s');
      final response = await http.get(url);
      final decondedJson = jsonDecode(response.body) as Map<String, dynamic>;
      final meals = <Map<String, dynamic>>[...decondedJson['meals']];
      return meals.map((meal) => Meal.fromJson(meal)).toList();
    } on HttpException {
      throw CustomException('No Internet Connection!');
    } on SocketException {
      throw CustomException('No Internet Connection!');
    } catch (e) {
      throw CustomException('Unknown Error!');
    }
  }

  static Future<List<Category>> fetchAllCategoriesFromAPI() async {
    try {
      final url =
          Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');
      final response = await http.get(url);
      final decondedJson = jsonDecode(response.body) as Map<String, dynamic>;
      final categories = <Map<String, dynamic>>[...decondedJson['categories']];
      return categories.map((category) => Category.fromJson(category)).toList();
    } on HttpException {
      throw CustomException('No Internet Connection!');
    } on SocketException {
      throw CustomException('No Internet Connection!');
    } catch (e) {
      throw CustomException('Unknown Error!');
    }
  }
}
