import 'package:flutter/material.dart';
import 'package:parsing_task1/model/emp_model.dart';
import 'package:parsing_task1/model/empcreate_model.dart';
import 'package:parsing_task1/model/empdelete.dart';
import 'package:parsing_task1/model/emplist_model.dart';
import 'package:parsing_task1/model/empone_model.dart';
import 'package:parsing_task1/model/empupdate_model.dart';

import 'package:parsing_task1/pages/detail.page.dart';
import 'package:parsing_task1/services/http_service.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> items = [];

  void _apiEmpList() {
    Network.GET(Network.API_EMP_LIST, Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiEmpOne(var id) {
    Network.GET(Network.API_EMP_ONE + id.toString(), Network.paramsEmpty())
        .then((response) => {print(response), _showResponse(response!)});
  }

  void _apiEmpCreate() {
    Network.POST(Network.API_EMP_CREATE, Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiEmpUpdate(var id) {
    Network.PUT(Network.API_EMP_UPDATE + id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiEmpDelete(var id) {
    Network.DEL(Network.API_EMP_DELETE + id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  // Xammasini telefon ekraniga chiqarish
  // void _showResponse(String response) {
  //   if (response != null) {
  //     EmpList empList = Network.parseEmpList(response);
  //     setState(() {
  //       items = empList.data;
  //     });
  //   } else {
  //     print('Try again');
  //     EmpOne empOne = Network.parseEmpOne(response);
  //     print(empOne.data.employee_name);
  //   }

  // Bittalikni va boshqalarni chiqarish
  void _showResponse(String response) {
    // EmpOne empOne = Network.parseEmpOne(response);
    // print(empOne.data.employee_name);
    //   print("-" * 25);
    //   print(empOne.data.employee_name);
    //   print(empOne.data.employee_age);
    // }

    // EmpCreate empCreate = Network.parseEmpCreate(response);
    // print(empCreate);
    //
    // EmpUpdate empUpdate = Network.parseUpdate(response);
    // print(empUpdate.data);

    EmpDelete empDelete = Network.parseEmpDelete(response);
    print(empDelete.data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _apiEmpList();
    // _apiEmpOne(1);
    // _apiEmpCreate();
    //_apiEmpUpdate(21);
    _apiEmpDelete(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, i) {
            return itemOfList(items[i]);
          }),
    );
  }

  Widget itemOfList(Employee emp) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              value:
                  emp.employee_name + "(" + emp.employee_age.toString() + ")",
              value2: emp.employee_salary.toString() + "\$",
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              emp.employee_name + "(" + emp.employee_age.toString() + ")",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              emp.employee_salary.toString() + "\$",
              style: TextStyle(color: Colors.black, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
