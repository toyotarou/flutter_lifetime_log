enum APIPath {
  getholiday,
  getLifetimeRecordItem,
  getLifetimeDateRecord,
  getLifetimeYearlyRecord,
  insertLifetime,
  getGenbaWorkTime,
  worktimemonthdata, //{"date":"2022-01-01"}
  worktimesummary,
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

      case APIPath.getGenbaWorkTime:
        return 'getGenbaWorkTime';
      case APIPath.worktimemonthdata:
        return 'worktimemonthdata';
      case APIPath.worktimesummary:
        return 'worktimesummary';
    }
  }
}
