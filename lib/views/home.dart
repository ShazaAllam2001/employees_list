import 'package:employes_list/models/employee.dart';
import 'package:employes_list/services/employee_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employee> employees = [];
  bool loading = true;
 
  getEmployees() async {
    employees = await EmployeeService().getEmployees();
    loading = false;
    setState(() {     
    });
  }

  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: loading ? 
          CircularProgressIndicator() :
          ListView.builder(
            itemCount: employees.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Column(
                  children: [
                    Text("Name : ${employees[index].employeeName}"),
                    Text("Salary : ${employees[index].employeeSalary}")
                  ],
                ),
              );
            }
          )
      ),
      floatingActionButton: IconButton(
        onPressed: () async {
          loading = true;
          setState(() {     
          });
          await getEmployees();
        }, 
        icon: Icon(Icons.download)
      ),
    );
  }
}
