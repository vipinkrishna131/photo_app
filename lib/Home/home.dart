import 'package:bmi_calculator/Home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final int height = 0, weight = 0;
  final TextEditingController textEditingControllerHeight =
      Get.put(TextEditingController(), tag: 'Height');
  final TextEditingController textEditingControllerWeight =
      Get.put(TextEditingController(), tag: 'Weight');

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Obx(
              () => CheckboxListTile(
                  contentPadding: EdgeInsets.all(0),
                  activeColor: Colors.pink,
                  dense: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    "Are you 20 or above ?",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  value: homeController.ageStatus.value,
                  onChanged: (newValue) {
                    homeController.ageStatus.value = newValue;
                  }),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingControllerHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8))),
                    labelText: 'Enter Height in cm',
                    errorText: homeController.heightValidate.value
                        ? 'Value can \'t be empty!'
                        : null,
                  ),
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingControllerWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8))),
                    labelText: 'Enter Weight in kg',
                    errorText: homeController.weightValidate.value
                        ? 'Value can \'t be empty!'
                        : null,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: ButtonTheme(
                child: ElevatedButton(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    minimumSize: Size(double.infinity, 55),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    homeController.navigateToResult();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
