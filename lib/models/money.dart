class MoneyModel {
  MoneyModel({
    required this.yen10000,
    required this.yen5000,
    required this.yen2000,
    required this.yen1000,
    required this.yen500,
    required this.yen100,
    required this.yen50,
    required this.yen10,
    required this.yen5,
    required this.yen1,
    required this.bankA,
    required this.bankB,
    required this.bankC,
    required this.bankD,
    required this.bankE,
    required this.payA,
    required this.payB,
    required this.payC,
    required this.payD,
    required this.payE,
    required this.payF,
    required this.sum,
  });

  factory MoneyModel.fromJson(Map<String, dynamic> json) => MoneyModel(
        yen10000: json['yen_10000'] ?? '',
        yen5000: json['yen_5000'] ?? '',
        yen2000: json['yen_2000'] ?? '',
        yen1000: json['yen_1000'] ?? '',
        yen500: json['yen_500'] ?? '',
        yen100: json['yen_100'] ?? '',
        yen50: json['yen_50'] ?? '',
        yen10: json['yen_10'] ?? '',
        yen5: json['yen_5'] ?? '',
        yen1: json['yen_1'] ?? '',
        bankA: json['bank_a'] ?? '',
        bankB: json['bank_b'] ?? '',
        bankC: json['bank_c'] ?? '',
        bankD: json['bank_d'] ?? '',
        bankE: json['bank_e'] ?? '',
        payA: json['pay_a'] ?? '',
        payB: json['pay_b'] ?? '',
        payC: json['pay_c'] ?? '',
        payD: json['pay_d'] ?? '',
        payE: json['pay_e'] ?? '',
        payF: json['pay_f'] ?? '',
        sum: json['sum'] ?? '',
      );
  String yen10000;
  String yen5000;
  String yen2000;
  String yen1000;
  String yen500;
  String yen100;
  String yen50;
  String yen10;
  String yen5;
  String yen1;
  String bankA;
  String bankB;
  String bankC;
  String bankD;
  String bankE;
  String payA;
  String payB;
  String payC;
  String payD;
  String payE;
  String payF;
  String sum;

  Map<String, dynamic> toJson() => {
        'yen_10000': yen10000,
        'yen_5000': yen5000,
        'yen_2000': yen2000,
        'yen_1000': yen1000,
        'yen_500': yen500,
        'yen_100': yen100,
        'yen_50': yen50,
        'yen_10': yen10,
        'yen_5': yen5,
        'yen_1': yen1,
        'bank_a': bankA,
        'bank_b': bankB,
        'bank_c': bankC,
        'bank_d': bankD,
        'bank_e': bankE,
        'pay_a': payA,
        'pay_b': payB,
        'pay_c': payC,
        'pay_d': payD,
        'pay_e': payE,
        'pay_f': payF,
        'sum': sum,
      };
}
