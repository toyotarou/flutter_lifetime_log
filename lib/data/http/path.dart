enum APIPath {
  getholiday,
  getLifetimeRecordItem,
  insertLifetime,
  getLifetimeDateRecord,
  getLifetimeYearlyRecord,
}

extension APIPathExtension on APIPath {
  String? get value {
    switch (this) {
      case APIPath.getholiday:
        return 'getholiday';

      case APIPath.getLifetimeRecordItem:
        return 'getLifetimeRecordItem';
      case APIPath.insertLifetime:
        return 'insertLifetime';
      case APIPath.getLifetimeDateRecord:
        return 'getLifetimeDateRecord';
      case APIPath.getLifetimeYearlyRecord:
        return 'getLifetimeYearlyRecord';
    }
  }
}
