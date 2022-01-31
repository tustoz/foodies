import 'dart:convert';

import 'package:foodies/models/category.dart';
import 'package:foodies/models/food_detail.dart';
import 'package:foodies/models/search_food.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://masak-apa-tomorisakura.vercel.app/';
const String foodDetailUrl = '/api/recipe/';
const String categoryUrl = '/api/categorys/recipes/';
const String searchUrl = '/api/search/?q=';

late Future<Category> futureCategory;

Future<Category> fetchCategory(String category) async {
  final response = await http.get(
    Uri.parse(
      baseUrl + categoryUrl + category,
    ),
  );

  if (response.statusCode == 200) {
    return Category.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Category');
  }
}

late Future<FoodDetail> futureFoodDetails;

Future<FoodDetail> fetchFoodDetails(String id) async {
  final response = await http.get(
    Uri.parse(
      baseUrl + foodDetailUrl + id,
    ),
  );

  if (response.statusCode == 200) {
    return FoodDetail.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Food Details');
  }
}

late Future<SearchFood> futureSearchFood;

Future<SearchFood> fetchSearchFood(String query) async {
  final response = await http.get(
    Uri.parse(
      baseUrl + searchUrl + query,
    ),
  );

  if (response.statusCode == 200) {
    return SearchFood.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Search Food');
  }
}
