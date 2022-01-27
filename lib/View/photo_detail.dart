import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_app/Common/global_values.dart';
import 'package:photo_app/Controller/photo_view_controller.dart';

class PhotoDetail extends StatelessWidget {
  final PhotoViewController photoViewController = Get.find();
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: deviceHeight * 0.88,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset('images/chair_detail.png').image, fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(deviceWidth * 0.13),
                  bottomRight: Radius.circular(deviceWidth * 0.13)),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, deviceHeight * 0.08, 10, 0),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.03,
                      ),
                      Image.asset(
                        'images/camera.png',
                        height: deviceHeight * 0.03,
                        width: deviceWidth * 0.07,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: deviceWidth * 0.02,
                      ),
                      Text(
                        'Point your camera at a furniture',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.2,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Stack(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration:
                                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration:
                                      BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.07,
              ),
              Container(
                width: deviceWidth * 0.65,
                height: deviceHeight * 0.08,
                decoration: BoxDecoration(
                    color: Colors.black38, borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Stack(
                        children: [
                          Container(
                            width: deviceWidth * 0.11,
                            height: deviceHeight * 0.11,
                            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'images/multiply.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: Text(
                        'Elementum Chair: 88.47%',
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: [
                      Container(
                        width: deviceWidth * 0.1,
                        height: deviceHeight * 0.05,
                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      Container(
                        width: deviceWidth * 0.1,
                        height: deviceHeight * 0.05,
                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.23,
              ),
              Container(
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.12,
                decoration: BoxDecoration(
                    color: Colors.black45, borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  children: [
                    Image.asset(
                      'images/chair1.png',
                      height: deviceWidth * 0.25,
                      width: deviceWidth * 0.25,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Elementum Chair',
                            style: TextStyle(color: Colors.white, letterSpacing: 1),
                          ),
                          SizedBox(
                            height: deviceHeight * 0.01,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'images/star.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text(
                                    '4.6',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: deviceWidth * 0.01,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'images/dollar.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text('224.00', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Stack(
                        children: [
                          Container(
                            width: deviceWidth * 0.1,
                            height: deviceHeight * 0.5,
                            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'images/chevronRight.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: GlobalValues.commonFloatingActionButton(deviceHeight, deviceWidth),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          GlobalValues.commonBottomAppBar(photoViewController, deviceHeight, deviceWidth),
    );
  }
}
