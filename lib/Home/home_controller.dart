import 'package:bmi_calculator/Result/result.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController textEditingControllerHeight = Get.find(tag: 'Height');
  TextEditingController textEditingControllerWeight = Get.find(tag: 'Weight');
  RxBool ageStatus, heightValidate, weightValidate;
  int height, weight;
  dynamic category, bmi;
  Color categoryColor;

  @override
  void onInit() {
    super.onInit();
    ageStatus = false.obs;
    heightValidate = false.obs;
    weightValidate = false.obs;
  }

  void navigateToResult() {
    if (ageStatus.value) {
      if (!GetUtils.isBlank(textEditingControllerHeight.text)) {
        if (!GetUtils.isBlank(textEditingControllerWeight.text)) {
          calculteBMI();

          Get.to(Result(), duration: Duration(seconds: 0));
        } else {
          weightValidate.value = true;
        }
      } else {
        heightValidate.value = true;
      }
    } else {
      Get.snackbar("Sorry", "Required at least 20 years old",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void calculteBMI() {
    height = int.parse(textEditingControllerHeight.text);
    weight = int.parse(textEditingControllerWeight.text);
    var heightInMetre = height / 100;
    bmi = weight / (heightInMetre * heightInMetre);
    selectCategory(bmi);
  }

  void selectCategory(double bmi) {
    if (bmi < 18.5) {
      category = "Underweight";
      categoryColor = Colors.white;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      category = "Healthy Weight";
      categoryColor = Colors.green;
    } else if (bmi >= 25 && bmi < 29.9) {
      category = "Over Weight";
      categoryColor = Colors.yellow;
    } else if (bmi >= 30 && bmi < 34.9) {
      category = "Obese";
      categoryColor = Colors.orange;
    } else if (bmi >= 35 && bmi < 39.9) {
      category = "Severly Obese";
      categoryColor = Colors.red;
    } else if (bmi >= 40) {
      category = "Morbidly Obese";
      categoryColor = Colors.purple;
    }
  }
}
