import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  static final String id = "screen";

  var value;
  var value2;

  DetailPage({Key? key, required this.value, this.value2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter BEST"),
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(value2, style: TextStyle(color: Colors.black, fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}