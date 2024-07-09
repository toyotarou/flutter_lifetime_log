class GenbaWorkTimeModel {
  GenbaWorkTimeModel({
    required this.company,
    required this.genba,
    required this.start,
    required this.end,
  });

  factory GenbaWorkTimeModel.fromJson(Map<String, dynamic> json) =>
      GenbaWorkTimeModel(
        company: json['company'],
        genba: json['genba'],
        start: json['start'],
        end: json['end'],
      );
  String company;
  String genba;
  String start;
  String end;

  Map<String, dynamic> toJson() => {
        'company': company,
        'genba': genba,
        'start': start,
        'end': end,
      };
}
