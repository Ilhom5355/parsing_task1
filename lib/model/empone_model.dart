import 'package:parsing_task1/model/emp_model.dart';

class EmpOne {
  var status;
  var message;
  Employee data;

  EmpOne.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = Employee.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
      };
}
