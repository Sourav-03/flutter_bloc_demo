import 'dart:async';

import 'employee.dart';

//TODO: Imports
//TODO: List of employees
//TODO: Stream controllers
//TODO: Stream sink controllers
//TODO: Constructor - add data; listener to changes
//TODO: Core functions
//TODO: Dispose

class EmployeeBloc {
  final List<Employee> _employeeList = [
    //Employees listed down are all frictional characters and
    // are not associated with any living or dead person.
    Employee(1, 'Dhanush', 'SSE', 2000000.00),
    Employee(2, 'Arjun', 'SE', 900000.00),
    Employee(3, 'Poojan', 'SSE', 1600000.00),
    Employee(4, 'Prabhu', 'SE', 970000.00),
    Employee(5, 'Prakash', 'ASE', 450000.00),
    Employee(6, 'Rajesh', 'ASE', 450000.00),
    Employee(7, 'Priya', 'ASE', 450000.00),
    Employee(8, 'Diya', 'ASE', 450000.00),
    Employee(9, 'Priyank', 'SE', 950000.00),
  ];

  //Stream controllers
  final _employeeListStreamController = StreamController<List<Employee>>();
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  //Getters
  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementStreamController.sink;

  //Constructors
  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);

    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);

    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  //Functional code
  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    print("Current salary : $salary");
    double incrementedSalary = salary * 20 / 100;
    print("Increment salary : $incrementedSalary");

    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    print("Current salary : $salary");
    double decrementedSalary = salary * 20 / 100;
    print("Increment salary : $decrementedSalary");

    _employeeList[employee.id - 1].salary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

  //Disposing all allocated resources to controller
  void disposeStreamControllers() {
    _employeeListStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
  }
}
