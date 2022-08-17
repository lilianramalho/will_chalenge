import 'package:will_challenge/data/provider/categories_data.dart';
import 'package:will_challenge/data/provider/meal_data.dart';

class Repository {
  final CategoryData _categoryData = CategoryData();
  final MealData _mealData = MealData();

  Future<Map<String, dynamic>> getCategories() async {
    Map<String, dynamic> mapCategory = await _categoryData.getCategories();
    return mapCategory;
  }

  Future<Map<String, dynamic>> getMeals(String category) async {
    Map<String, dynamic> mapMeals = await _mealData.getMeals(category);
    return mapMeals;
  }
}
