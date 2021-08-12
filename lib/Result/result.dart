import 'package:bmi_calculator/Home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your BMI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI:  ${homeController.bmi.toStringAsFixed(3)} ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: "   Category: ",
                    ),
                    TextSpan(
                        text: homeController.category,
                        style: TextStyle(color: homeController.categoryColor)),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
