import 'package:dio/dio.dart';
import 'package:employes_list/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeService {
  String endpoint = "http://dummy.restapiexample.com/api/v1/employees";

  Future<List<Employee>> getEmployees() async {
    List<Employee> employees = [];
    try {
      var response = await Dio().get(endpoint);
      var data = response.data;
      data.forEach((obj) {
        employees.add(Employee.fromJson(obj));
      });
      debugPrint(data);
    }
    catch(e) {
      debugPrint(e.toString());
    }
    return employees;
  }
}