import 'dart:math';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodies/models/article.dart';
import 'package:foodies/models/article_detail.dart';
import 'package:foodies/models/category.dart';
import 'package:foodies/models/food_detail.dart';
import 'package:foodies/models/search_food.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://masak-apa-tomorisakura.vercel.app/';
const String categoryUrl = '/api/categorys/recipes/';
const String articleUrl = '/api/categorys/article/';
const String articleDetailUrl = '/api/article/';
const String foodDetailUrl = '/api/recipe/';
const String searchUrl = '/api/search/?q=';

TextEditingController searchController = TextEditingController();
String query = '';

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

late Future futureController;

late Future<Article> futureArticle;

Future<Article> fetchArticle(String query) async {
  final response = await http.get(
    Uri.parse(
      baseUrl + articleUrl + query,
    ),
  );

  if (response.statusCode == 200) {
    return Article.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Search Food');
  }
}

late Future<ArticleDetail> futureArticleDetail;

Future<ArticleDetail> fetchArticleDetail(String tag, String id) async {
  final response = await http.get(
    Uri.parse(
      baseUrl + articleDetailUrl + tag + '/' + id,
    ),
  );

  if (response.statusCode == 200) {
    return ArticleDetail.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Search Food');
  }
}

int randomize(List data) {
  return Random().nextInt(data.length);
}
