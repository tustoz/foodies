import 'dart:math';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodies/models/category.dart';
import 'package:foodies/models/food_detail.dart';
import 'package:foodies/models/search_food.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://masak-apa-tomorisakura.vercel.app/api';
const String categoryUrl = '/category/recipes/';
const String foodDetailUrl = '/recipe/';
const String searchUrl = '/search/?q=';

Map<String, String> headers = {
  'Content-Type': 'application/json;charset=UTF-8',
  'Charset': 'utf-8'
};

TextEditingController searchController = TextEditingController();
String query = '';

late Future<Category> futureCategory;

Future<Category> fetchCategory(String category) async {
  final response = await http.get(
    Uri.parse(
      baseUrl + categoryUrl + category,
    ),
    headers: headers,
  );
  if (response.statusCode == 200) {
    return Category.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Food Category');
  }
}

late Future<FoodDetail> futureFoodDetails;

Future<FoodDetail> fetchFoodDetails(String id) async {
  final response = await http.get(
    Uri.parse(
      baseUrl + foodDetailUrl + id,
    ),
    headers: headers,
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
    headers: headers,
  );

  if (response.statusCode == 200) {
    return SearchFood.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Search Food');
  }
}

int randomize(List data) {
  return Random().nextInt(data.length);
}
