import 'dart:convert';
import 'package:employee_directory_application/Employee/employee_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'employee_controller.dart';

class EmployeeListView extends StatelessWidget {
  final EmployeeController employeeController = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Employee List'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    employeeController.filterSearchResults(value);
                  },
                  controller: employeeController.textEditingController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Obx(() {
                return Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: employeeController.duplicateItems.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Get.to(EmployeeDetail(employeeController.duplicateItems[index]),
                                    duration: Duration(seconds: 0));
                              },
                              child: Row(
                                children: [
                                  Container(
                                      width: 150,
                                      height: 100,
                                      margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                                      child:
                                          employeeController.duplicateItems[index].profileImage ==
                                                  null
                                              ? Image.asset(
                                                  'assets/placeholder.png',
                                                  width: 150,
                                                  height: 100,
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.memory(
                                                  base64Decode(employeeController
                                                      .duplicateItems[index].profileImage),
                                                  width: 150,
                                                  height: 100,
                                                  fit: BoxFit.fill,
                                                )),
                                  Flexible(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(employeeController.duplicateItems[index].name ??
                                          'Unknown name'),
                                      Text(
                                        employeeController.duplicateItems[index].company?.name ??
                                            'Unknown company',
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                );
              }),
            ],
          ),
        ));
  }
}
