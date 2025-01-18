import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:employes_list/models/employee.dart';

class EmployeeService {
  final Uri endpoint = Uri.parse("http://dummy.restapiexample.com/api/v1/employees/");

  Future<List<Employee>> getEmployees() async {
    List<Employee> employees = [];
    try {
      final response = await http.get(endpoint);
      final data = json.decode(response.body)['data'];
      debugPrint(data);
      employees = data.map((obj) => Employee.fromJson(obj)).toList();
    }
    catch(e) {
      debugPrint(e.toString());
    }
    return employees;
  }
}