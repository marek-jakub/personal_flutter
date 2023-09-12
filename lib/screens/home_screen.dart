import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  //late AppDb _db;
  final pages = const [
    // EmployeeNotifierFutureScreen(),
    // EmployeeNotifierStreamScreen(),
    // EmployeeAddressScreen()
    //EmployeeStreamScreen()
  ];

  @override
  void initState() {
    super.initState();

    //_db = AppDb();
  }

  @override
  void dispose() {
    //_db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add_employee');
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Employee'),
      ),
    );
  }
}
