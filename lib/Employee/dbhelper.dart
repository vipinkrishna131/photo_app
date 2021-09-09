import 'dart:io';
import 'package:employee_directory_application/Employee/employee_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databasename = "employee.db";
  static final table = "employee_table";
  static final columnId = "id";
  static final columnName = "name";
  static final columnUsername = "username";
  static final columnEmail = "email";
  static final columnImage = "image";
  static final columnStreet = "street";
  static final columnSuite = "suite";
  static final columnCity = "city";
  static final columnZipcode = "zipcode";
  static final columnPhone = "phone";
  static final columnWebsite = "website";
  static final columnCompany = "company";

  DatabaseHelper._createInstance();
  static final DatabaseHelper instance = DatabaseHelper._createInstance();
  static Database _database;
  Future<int> result;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databasename);

    return await openDatabase(path, version: 2, onCreate: _createDb);
  }

  Future _createDb(Database db, int newVersion) async {
    await db.execute(
        ''' CREATE TABLE $table ($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT NOT NULL , 
         $columnUsername TEXT, $columnEmail TEXT, $columnImage TEXT, $columnStreet TEXT, $columnSuite TEXT, $columnCity TEXT, $columnZipcode TEXT, 
         $columnPhone INTEGER, $columnWebsite TEXT, $columnCompany TEXT ) ''');
  }

  Future<int> insertEmployee(List<EmployeeModel> employees) async {
    Database db = await instance.database;

    for (int i = 0; i < employees.length; i++) {
      result = db.rawInsert(
          'INSERT INTO $table($columnName, $columnUsername , $columnEmail , $columnImage , $columnStreet , $columnSuite , '
          ' $columnCity , $columnZipcode , $columnPhone , $columnWebsite , $columnCompany) VALUES(?,?,?,?,?,?,?,?,?,?,?)',
          [
            employees[i].name,
            employees[i].username,
            employees[i].email,
            employees[i].profileImage,
            employees[i].address?.street,
            employees[i].address?.suite,
            employees[i].address?.city,
            employees[i].address?.zipcode,
            employees[i].phone,
            employees[i].website,
            employees[i].company?.name
          ]);
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> getEmployeeList() async {
    Database db = await instance.database;

    var result = await db?.query(table);
    return result;
  }
}
