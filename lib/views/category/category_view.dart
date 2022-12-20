import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:will_challenge/controller/category_controller.dart';
import 'package:will_challenge/utils/custom_colors.dart';
import 'package:will_challenge/views/category/category_card.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: CustomColors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Obx( (() => 
      !categoryController.isLoarding.value ?
         Container(
          child: 
           ListView.builder(
            key: Key("List-category"),
              padding: const EdgeInsets.all(8),
              itemCount: categoryController.listCategory?.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  urlImage: categoryController.listCategory
                      ?.elementAt(index)
                      .strCategoryThumb,
                  title: categoryController.listCategory
                      ?.elementAt(index)
                      .strCategory,
                  description: categoryController.listCategory
                      ?.elementAt(index)
                      .strCategoryDescription,
                );
              }),
        )
        : Center(
          child: const LoadingIndicator(
            indicatorType: Indicator.ballPulse,)
        ))
      ),
    );
  }
}
