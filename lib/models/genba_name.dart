class GenbaNameModel {
  GenbaNameModel({
    required this.yearmonth,
    required this.company,
    required this.genba,
  });

  factory GenbaNameModel.fromJson(Map<String, dynamic> json) => GenbaNameModel(
        yearmonth: json['yearmonth'],
        company: json['company'],
        genba: json['genba'],
      );
  String yearmonth;
  String company;
  String genba;

  Map<String, dynamic> toJson() => {
        'yearmonth': yearmonth,
        'company': company,
        'genba': genba,
      };
}
