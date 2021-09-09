import 'package:employee_directory_application/Employee/employee_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<List<EmployeeModel>> fetchEmployees() async {
    var response = await client
        .get(Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return employeeModelFromJson(jsonString);
    } else {
      throw NullThrownError();
    }
  }
}
