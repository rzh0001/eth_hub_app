class AppUrl {
  /// dev
  static const String dev = 'http://192.168.206.1:8080/eth_hub';
  static const String prod = 'http://www.ethhub.vip:8080/eth_hub';

  /// Server Api
  // static const String baseUrl = dev;
  static const String baseUrl = prod;

  static const String mining = '$baseUrl/app/member/miningData/';
  static const String bill = '$baseUrl/app/member/bill/';
}
