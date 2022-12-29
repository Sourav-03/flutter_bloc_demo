import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo1/employee.dart';
import 'package:flutter_bloc_demo1/employee_block.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    super.dispose();
    employeeBloc.disposeStreamControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter BLOC'),
      ),
      body: StreamBuilder<List<Employee>>(
          stream: employeeBloc.employeeListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '${snapshot.data![index].id.toString()}.',
                            style: const TextStyle(fontSize: 26),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data![index].empName,
                                style: const TextStyle(fontSize: 22),
                              ),
                              Text(
                                snapshot.data![index].designation,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '₹ ${snapshot.data![index].salary.toString()}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            employeeBloc.employeeSalaryIncrement
                                .add(snapshot.data![index]);
                          },
                          icon: const Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            employeeBloc.employeeSalaryDecrement
                                .add(snapshot.data![index]);
                          },
                          icon: const Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
