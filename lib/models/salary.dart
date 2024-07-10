class SalaryTotalModel {
  SalaryTotalModel({
    required this.year,
    required this.salary,
  });

  factory SalaryTotalModel.fromJson(Map<String, dynamic> json) =>
      SalaryTotalModel(
        year: json['year'],
        salary: json['salary'],
      );
  int year;
  String salary;

  Map<String, dynamic> toJson() => {
        'year': year,
        'salary': salary,
      };
}

class SalaryModel {
  SalaryModel({required this.yearmonth, required this.salary});

  String yearmonth;
  String salary;
}
