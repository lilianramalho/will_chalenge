import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:will_challenge/controller/meal_controller.dart';
import 'package:will_challenge/utils/custom_colors.dart';
import 'package:will_challenge/views/category/category_info.dart';
import 'package:will_challenge/views/meal/meal_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key, required this.urlImage, this.title, this.description})
      : super(key: key);
  final String? urlImage;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    MealController mealController = Get.put(MealController());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 75.w,
        decoration: BoxDecoration(
          color: CustomColors.white,
        ),
        child: Column(
          children: [
            Container(
              width: 30.w,
              height: 20.h,
              child: Image.network(urlImage.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                title.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AutoSizeText(
                description.toString(),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => {
                          Get.to(CategoryInfo(
                            title: title,
                            url: urlImage,
                            description: description,
                          ))
                        },
                    icon: Icon(
                      Icons.info,
                      size: 30.px,
                    )),
                Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      await mealController.getMeals(title.toString());
                      Get.to(MealView());
                    },
                    child: Text(
                      "Ver ingredientes >",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.salmon,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
