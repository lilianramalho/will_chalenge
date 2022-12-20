import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:will_challenge/controller/category_controller.dart';
import 'package:will_challenge/data/provider/categories_data.dart';
import 'package:will_challenge/repository/repository.dart';
import 'package:will_challenge/utils/custom_colors.dart';
import 'package:will_challenge/views/category/category_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: Color(0xffF8EFBA),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: LottieBuilder.network(
                      'https://assets3.lottiefiles.com/temp/lf20_nXwOJj.json'),
                ),
              ],
            ),
          ),
          Container(
            width: 100.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: CustomColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  'Seja bem vindo!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                ElevatedButton(
                  key: Key("button"),
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.salmon,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      await categoryController.getCategories();
                      Get.to(CategoryView());
                    },
                    child: Text('Clique aqui para iniciar',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
