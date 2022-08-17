import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:will_challenge/utils/custom_colors.dart';

class CategoryInfo extends StatelessWidget {
  const CategoryInfo({Key? key, this.url, this.title, this.description})
      : super(key: key);
  final String? url;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: CustomColors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(children: [
                Container(
                  width: 40.w,
                  height: 30.h,
                  child: Image.network(url.toString()),
                ),
                AutoSizeText(
                  title.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ]),
            ),
            SlidingUpPanel(
              backdropEnabled: true,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              panel: Center(
                child: Text(
                  description.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ));
  }
}
