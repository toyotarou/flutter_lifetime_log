class WorkTimeMonthDataModel {
  WorkTimeMonthDataModel({
    required this.date,
    required this.workStart,
    required this.workEnd,
  });

  factory WorkTimeMonthDataModel.fromJson(Map<String, dynamic> json) =>
      WorkTimeMonthDataModel(
        date: DateTime.parse(json['date']),
        workStart: json['work_start'],
        workEnd: json['work_end'],
      );
  DateTime date;
  String workStart;
  String workEnd;

  Map<String, dynamic> toJson() => {
        'date':
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        'work_start': workStart,
        'work_end': workEnd,
      };
}
