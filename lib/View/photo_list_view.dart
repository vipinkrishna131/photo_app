import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_app/Common/global_values.dart';
import 'package:photo_app/View/photo_detail.dart';
import 'package:photo_app/Controller/photo_view_controller.dart';

class PhotoListView extends StatelessWidget {
  final GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
  final PhotoViewController photoViewController = Get.put(PhotoViewController());

  @override
  Widget build(BuildContext context) {
    var global = Get.put(GlobalValues(context));
    double deviceHeight = global.deviceHeight;
    double deviceWidth = global.deviceWidth;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Rated',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Image.asset(
                  'images/filter.png',
                  width: 20,
                  height: 20,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            ConstrainedBox(
              constraints: new BoxConstraints(
                maxHeight: deviceHeight * 0.05,
              ),
              child: ListView.builder(
                itemCount: photoViewController.categoryList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        child: GestureDetector(
                          onTap: () {
                            photoViewController.toggleSelection(index);
                          },
                          child: Obx(() {
                            return Container(
                              decoration: BoxDecoration(
                                color: photoViewController.isSelected.value == index
                                    ? Colors.black
                                    : Color(0xffEEEEEB),
                              ),
                              height: deviceHeight * 0.1,
                              width: deviceWidth * 0.3,
                              child:
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                Image.asset(
                                  photoViewController.categoryList[index].image,
                                  width: deviceWidth * 0.08,
                                  height: deviceHeight * 0.05,
                                  color: photoViewController.isSelected.value == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Text(
                                  photoViewController.categoryList[index].name,
                                  style: TextStyle(
                                    color: photoViewController.isSelected.value == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ]),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.05,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '147 products',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Most popular',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Image.asset(
                          'images/arrow.png',
                          width: 15,
                          height: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: photoViewController.photoList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).orientation == Orientation.landscape ? 2 : 2,
                  crossAxisSpacing: 10,
                  mainAxisExtent: deviceHeight * 0.32,
                  mainAxisSpacing: 10,
                  childAspectRatio: (1 / 1),
                ),
                itemBuilder: (context, index) {
                  return Transform.translate(
                    offset: Offset(0.0, index.isOdd ? 40 : 0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xffEEEEEB)),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(PhotoDetail());
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                photoViewController.photoList[index].image,
                                height: deviceHeight * 0.25,
                                width: deviceWidth * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(photoViewController.photoList[index].name),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(3, 5, 5, 0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'images/dollar.png',
                                              height: 20,
                                              width: 20,
                                            ),
                                            Text(photoViewController.photoList[index].price),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              'images/star.png',
                                              height: 20,
                                              width: 20,
                                            ),
                                            Text(photoViewController.photoList[index].rating),
                                          ],
                                        ),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: global.commonFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: global.commonBottomAppBar(),
    );
  }
}
