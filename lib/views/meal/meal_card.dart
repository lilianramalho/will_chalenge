import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:will_challenge/utils/custom_colors.dart';

class MealCard extends StatelessWidget {
  const MealCard({Key? key, required this.title, required this.urlImage})
      : super(key: key);
  final String? title;
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
