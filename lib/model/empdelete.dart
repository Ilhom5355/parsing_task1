import 'package:parsing_task1/model/emp_model.dart';

class EmpDelete {
  var status;
  var message;
  Employee data;

  EmpDelete.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = Employee.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}