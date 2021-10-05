/// success : true
/// message : "操作成功！"
/// code : 200
/// result : {"activeWorkers":10,"inactiveWorkers":0,"workers":10,"reportedHashrate":2.518,"currentHashrate":2.583,"validShares":2134,"invalidShares":0,"staleShares":48,"balance":0.00000,"totalEarnings":0.00000,"unpaid":0.10056}
/// timestamp : 1633248830047

class MiningData {
  MiningData({
    bool? success,
    String? message,
    int? code,
    Result? result,
    int? timestamp,
  }) {
    _success = success;
    _message = message;
    _code = code;
    _result = result;
    _timestamp = timestamp;
  }

  MiningData.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _code = json['code'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _timestamp = json['timestamp'];
  }
  bool? _success;
  String? _message;
  int? _code;
  Result? _result;
  int? _timestamp;

  bool? get success => _success;
  String? get message => _message;
  int? get code => _code;
  Result? get result => _result;
  int? get timestamp => _timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['code'] = _code;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['timestamp'] = _timestamp;
    return map;
  }
}

/// activeWorkers : 10
/// inactiveWorkers : 0
/// workers : 10
/// reportedHashrate : 2.518
/// currentHashrate : 2.583
/// validShares : 2134
/// invalidShares : 0
/// staleShares : 48
/// balance : 0.00000
/// totalEarnings : 0.00000
/// unpaid : 0.10056

class Result {
  Result({
    int? activeWorkers,
    int? inactiveWorkers,
    int? workers,
    double? reportedHashrate,
    double? currentHashrate,
    int? validShares,
    int? invalidShares,
    int? staleShares,
    double? balance,
    double? totalEarnings,
    double? unpaid,
  }) {
    _activeWorkers = activeWorkers;
    _inactiveWorkers = inactiveWorkers;
    _workers = workers;
    _reportedHashrate = reportedHashrate;
    _currentHashrate = currentHashrate;
    _validShares = validShares;
    _invalidShares = invalidShares;
    _staleShares = staleShares;
    _balance = balance;
    _totalEarnings = totalEarnings;
    _unpaid = unpaid;
  }

  Result.fromJson(dynamic json) {
    _activeWorkers = json['activeWorkers'];
    _inactiveWorkers = json['inactiveWorkers'];
    _workers = json['workers'];
    _reportedHashrate = json['reportedHashrate'];
    _currentHashrate = json['currentHashrate'];
    _validShares = json['validShares'];
    _invalidShares = json['invalidShares'];
    _staleShares = json['staleShares'];
    _balance = json['balance'];
    _totalEarnings = json['totalEarnings'];
    _unpaid = json['unpaid'];
  }
  int? _activeWorkers;
  int? _inactiveWorkers;
  int? _workers;
  double? _reportedHashrate;
  double? _currentHashrate;
  int? _validShares;
  int? _invalidShares;
  int? _staleShares;
  double? _balance;
  double? _totalEarnings;
  double? _unpaid;

  int? get activeWorkers => _activeWorkers;
  int? get inactiveWorkers => _inactiveWorkers;
  int? get workers => _workers;
  double? get reportedHashrate => _reportedHashrate;
  double? get currentHashrate => _currentHashrate;
  int? get validShares => _validShares;
  int? get invalidShares => _invalidShares;
  int? get staleShares => _staleShares;
  double? get balance => _balance;
  double? get totalEarnings => _totalEarnings;
  double? get unpaid => _unpaid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activeWorkers'] = _activeWorkers;
    map['inactiveWorkers'] = _inactiveWorkers;
    map['workers'] = _workers;
    map['reportedHashrate'] = _reportedHashrate;
    map['currentHashrate'] = _currentHashrate;
    map['validShares'] = _validShares;
    map['invalidShares'] = _invalidShares;
    map['staleShares'] = _staleShares;
    map['balance'] = _balance;
    map['totalEarnings'] = _totalEarnings;
    map['unpaid'] = _unpaid;
    return map;
  }
}
