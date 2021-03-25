import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:networking/model/author.dart';

class API {
  static const String _BASE_URL = 'http://dummy.restapiexample.com/api/v1/employees';
  static Future<Employee> createEmployee(Employee employee) async {
    //business logic to send data to server
    final Response response = await post('$_BASE_URL/employee',
        headers: <String, String>{
          'status': 'success'
        },
        body: jsonEncode(employee.toJson()));

    if (response.statusCode == 200) {
      //print(response.body);
      return Employee.fromJson(json.decode(response.body));
    } else {
      //print('Error');
      throw Exception("Can't load author");
    }
  }

  static Future<List<Employee>> getAllEmployees() async {
    //business logic to send data to server
    final Response response = await get('http://dummy.restapiexample.com/api/v1/create/create');

    if (response.statusCode == 200) {
      //print(response.body);
      //parse json into list of objects
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Employee>((item) => Employee.fromJson(item)).toList();
    } else {
      print('Error');
      throw Exception("Can't load ");
    }
  }
}
