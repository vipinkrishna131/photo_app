import 'dart:convert';
import 'package:employee_directory_application/Employee/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetail extends StatelessWidget {
  static EmployeeModel employeeModel;
  EmployeeDetail(EmployeeModel employeeData) {
    employeeModel = employeeData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Detail'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 26, 8, 8),
                child: employeeModel.profileImage != null
                    ? Image.memory(
                        base64Decode(employeeModel.profileImage),
                        width: 150,
                        height: 100,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        'assets/placeholder.png',
                        width: 150,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: employeeModel.name != null
                    ? Text(
                        'Name: ' + employeeModel.name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    : Text('Name: NA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: employeeModel.username != null
                    ? Text(
                        'Username: ' + employeeModel.username,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    : Text('Username: NA',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: employeeModel.email != null
                    ? Text('Email: ' + employeeModel.email,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                    : Text('Email : NA',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: employeeModel.address?.street != null
                    ? Text('Street: ' + employeeModel.address.street,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                    : Text('Street: NA',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: employeeModel.address?.suite != null
                    ? Text('Suite: ' + employeeModel.address.suite,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                    : Text('Suite: NA',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: employeeModel.address?.city != null
                    ? Text('City: ' + employeeModel.address.city,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                    : Text('City: NA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: employeeModel.address?.zipcode != null
                    ? Text('Zipcode: ' + employeeModel.address.zipcode,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                    : Text('Zipcode: NA',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: employeeModel?.phone != null
                    ? Text('Phone: ' + employeeModel.phone,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                    : Text('Phone: NA ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: employeeModel.website != null
                    ? Text('Website: ' + employeeModel.website,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                    : Text('Website: NA',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: employeeModel.company?.name != null
                    ? Text('Company: ' + employeeModel.company.name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                    : Text('Company: NA',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
