class Employee {
  late String _empName;
  late String _designation;
  late int _id;
  late double _salary;

  Employee(this._id, this._empName, this._designation, this._salary);

  set id(int id) {
    _id = id;
  }

  set empName(String empName) {
    _empName = empName;
  }

  set designation(String designation) {
    _designation = designation;
  }

  set salary(double salary) {
    _salary = salary;
  }

  int get id => this._id;

  double get salary => this._salary;

  String get empName => this._empName;

  String get designation => this._designation;
}
