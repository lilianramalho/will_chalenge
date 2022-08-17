import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:will_challenge/controller/meal_controller.dart';
import 'package:will_challenge/utils/custom_colors.dart';
import 'package:will_challenge/views/meal/meal_card.dart';

class MealView extends StatelessWidget {
  const MealView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MealController mealController = Get.find();
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: CustomColors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: mealController.listMeal?.length,
            itemBuilder: (BuildContext context, int index) {
              return MealCard(
                title: mealController.listMeal?.elementAt(index).strMeal,
                urlImage:
                    mealController.listMeal?.elementAt(index).strMealThumb,
              );
            }),
      ),
    );
  }
}
