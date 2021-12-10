class Employee {
  var id;
  var employee_name;
  var employee_salary;
  var employee_age;
  var profile_image;

  Employee.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        employee_name = json['employee_name'],
        employee_salary = json['employee_salary'],
        employee_age = json['employee_age'],
        profile_image = json['profile_image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'employee_name': employee_name,
        'employee_salary': employee_salary,
        'employee_age': employee_age,
        'profile_image': profile_image,
      };
}
