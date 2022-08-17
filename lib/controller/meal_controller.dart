import 'package:get/get.dart';
import 'package:will_challenge/model/meal/meal.dart';
import 'package:will_challenge/repository/repository.dart';

class MealController extends GetxController {
  final Repository _repository = Repository();
  List<Meal>? listMeal;
  RxBool isLoarding = false.obs;

  getMeals(String category) async {
    isLoarding.value = true;
    Map<String, dynamic> result = await _repository.getMeals(category);
    listMeal = result['meals']
        .map<Meal>((meals) {
          return Meal.fromJson(meals);
        })
        .cast<Meal>()
        .toList();
    isLoarding.value = false;
  }
}
