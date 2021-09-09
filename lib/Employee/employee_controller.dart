import 'dart:convert';
import 'dart:typed_data';
import 'package:employee_directory_application/Employee/dbhelper.dart';
import 'package:employee_directory_application/Employee/employee_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'api_service.dart';

class EmployeeController extends GetxController {
  var employeeList = <EmployeeModel>[];
  var duplicateItems = <EmployeeModel>[].obs;
  var textEditingController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;
  var newList = <EmployeeModel>[];
  var mapList = <Map<String, dynamic>>[];

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  void fetchEmployees() async {
    try {
      mapList = await dbHelper.getEmployeeList();
      if (mapList.isEmpty) {
        employeeList = await ApiService.fetchEmployees();
        // Converts images to base64
        await convertImages(employeeList);
        // Inserting to database
        await dbHelper.insertEmployee(employeeList);
        // Querying database
        mapList = await dbHelper.getEmployeeList();
      }
    } finally {
      for (int i = 0; i < mapList.length; i++) {
        newList.add(EmployeeModel.fromMap(mapList[i]));
      }
      duplicateItems.addAll(newList);
    }
  }

  void filterSearchResults(String query) {
    var dummySearchList = <EmployeeModel>[];
    dummySearchList.addAll(employeeList);
    if (query.isNotEmpty) {
      var dummyListData = <EmployeeModel>[];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query) || item.email.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });

      duplicateItems.clear();
      duplicateItems.addAll(dummyListData);

      return;
    } else {
      duplicateItems.clear();
      duplicateItems.addAll(employeeList);
    }
  }

  convertImages(List<EmployeeModel> employeeList) async {
    for (int i = 0; i < employeeList.length; i++) {
      if (employeeList[i]?.profileImage != null) {
        ByteData imageData =
            await NetworkAssetBundle(Uri.parse(employeeList[i]?.profileImage)).load("");
        final Uint8List bytes = imageData.buffer.asUint8List();
        employeeList[i].profileImage = base64Encode(bytes);
      } else {
        employeeList[i].profileImage = null;
      }
    }
  }
}
