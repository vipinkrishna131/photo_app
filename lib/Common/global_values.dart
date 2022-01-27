import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_app/Controller/photo_view_controller.dart';

class GlobalValues {
  static commonFloatingActionButton(double deviceHeight, double deviceWidth) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      child: Image.asset(
        'images/bag.png',
        width: deviceWidth * 0.08,
        height: deviceHeight * 0.05,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }

  static commonBottomAppBar(
      PhotoViewController photoViewController, double deviceHeight, double deviceWidth) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: Container(
        height: deviceHeight * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              return IconButton(
                  onPressed: () {
                    photoViewController.toggleIndex(0);
                  },
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: photoViewController.indexValue.value == 0 ? Colors.black : Colors.grey,
                  ));
            }),
            Obx(() {
              return IconButton(
                  onPressed: () {
                    photoViewController.toggleIndex(1);
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: photoViewController.indexValue.value == 1 ? Colors.black : Colors.grey,
                  ));
            }),
            Obx(() {
              return IconButton(
                  onPressed: () {
                    photoViewController.toggleIndex(2);
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                    color: photoViewController.indexValue.value == 2 ? Colors.black : Colors.grey,
                  ));
            }),
            Obx(() {
              return IconButton(
                  onPressed: () {
                    photoViewController.toggleIndex(3);
                  },
                  icon: Image.asset(
                    'images/avatar.png',
                    width: deviceWidth * 0.08,
                    height: deviceHeight * 0.05,
                    color: photoViewController.indexValue.value == 3 ? Colors.black : Colors.grey,
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
