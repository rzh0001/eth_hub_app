/// success : true
/// message : "操作成功！"
/// code : 200
/// result : {"activeWorkers":5,"inactiveWorkers":5,"workers":10,"reportedHashrate":1.21,"currentHashrate":1.18,"averageHashrate":1631.0,"validShares":1000,"invalidShares":0,"staleShares":25,"balance":0.3977,"totalEarnings":0.3977,"unpaid":0.0582,"coinsPerDay":0.029862845530981157,"cnyPrice":22673.29000000000000000000,"usdPrice":3455.63000000000000000000}
/// timestamp : 1634104825527

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

/// activeWorkers : 5
/// inactiveWorkers : 5
/// workers : 10
/// reportedHashrate : 1.21
/// currentHashrate : 1.18
/// averageHashrate : 1631.0
/// validShares : 1000
/// invalidShares : 0
/// staleShares : 25
/// balance : 0.3977
/// totalEarnings : 0.3977
/// unpaid : 0.0582
/// coinsPerDay : 0.029862845530981157
/// cnyPrice : 22673.29000000000000000000
/// usdPrice : 3455.63000000000000000000

class Result {
  Result({
    int? activeWorkers,
    int? inactiveWorkers,
    int? workers,
    double? reportedHashrate,
    double? currentHashrate,
    double? averageHashrate,
    int? validShares,
    int? invalidShares,
    int? staleShares,
    double? balance,
    double? totalEarnings,
    double? unpaid,
    double? coinsPerDay,
    double? cnyPrice,
    double? usdPrice,
  }) {
    _activeWorkers = activeWorkers;
    _inactiveWorkers = inactiveWorkers;
    _workers = workers;
    _reportedHashrate = reportedHashrate;
    _currentHashrate = currentHashrate;
    _averageHashrate = averageHashrate;
    _validShares = validShares;
    _invalidShares = invalidShares;
    _staleShares = staleShares;
    _balance = balance;
    _totalEarnings = totalEarnings;
    _unpaid = unpaid;
    _coinsPerDay = coinsPerDay;
    _cnyPrice = cnyPrice;
    _usdPrice = usdPrice;
  }

  Result.fromJson(dynamic json) {
    _activeWorkers = json['activeWorkers'];
    _inactiveWorkers = json['inactiveWorkers'];
    _workers = json['workers'];
    _reportedHashrate = json['reportedHashrate'];
    _currentHashrate = json['currentHashrate'];
    _averageHashrate = json['averageHashrate'];
    _validShares = json['validShares'];
    _invalidShares = json['invalidShares'];
    _staleShares = json['staleShares'];
    _balance = json['balance'];
    _totalEarnings = json['totalEarnings'];
    _unpaid = json['unpaid'];
    _coinsPerDay = json['coinsPerDay'];
    _cnyPrice = json['cnyPrice'];
    _usdPrice = json['usdPrice'];
  }
  int? _activeWorkers;
  int? _inactiveWorkers;
  int? _workers;
  double? _reportedHashrate;
  double? _currentHashrate;
  double? _averageHashrate;
  int? _validShares;
  int? _invalidShares;
  int? _staleShares;
  double? _balance;
  double? _totalEarnings;
  double? _unpaid;
  double? _coinsPerDay;
  double? _cnyPrice;
  double? _usdPrice;

  int? get activeWorkers => _activeWorkers;
  int? get inactiveWorkers => _inactiveWorkers;
  int? get workers => _workers;
  double? get reportedHashrate => _reportedHashrate;
  double? get currentHashrate => _currentHashrate;
  double? get averageHashrate => _averageHashrate;
  int? get validShares => _validShares;
  int? get invalidShares => _invalidShares;
  int? get staleShares => _staleShares;
  double? get balance => _balance;
  double? get totalEarnings => _totalEarnings;
  double? get unpaid => _unpaid;
  double? get coinsPerDay => _coinsPerDay;
  double? get cnyPrice => _cnyPrice;
  double? get usdPrice => _usdPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activeWorkers'] = _activeWorkers;
    map['inactiveWorkers'] = _inactiveWorkers;
    map['workers'] = _workers;
    map['reportedHashrate'] = _reportedHashrate;
    map['currentHashrate'] = _currentHashrate;
    map['averageHashrate'] = _averageHashrate;
    map['validShares'] = _validShares;
    map['invalidShares'] = _invalidShares;
    map['staleShares'] = _staleShares;
    map['balance'] = _balance;
    map['totalEarnings'] = _totalEarnings;
    map['unpaid'] = _unpaid;
    map['coinsPerDay'] = _coinsPerDay;
    map['cnyPrice'] = _cnyPrice;
    map['usdPrice'] = _usdPrice;
    return map;
  }
}
