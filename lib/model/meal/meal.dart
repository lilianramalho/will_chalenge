import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@freezed
class Meal with _$Meal {
  factory Meal({
    required String idMeal,
    required String strMeal,
    required String strMealThumb,
  }) = _Meal;

  factory Meal.fromJson(Map<String, Object?> json) => _$MealFromJson(json);
}
