import 'dart:convert';

//import 'package:cookie_jar/cookie_jar.dart';
import 'package:eth_hub_app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart';
import 'http.dart'; // make dio as global top-level variable
import 'pages/mining/mining_view.dart';
import 'utils/storage.dart';

// Must be top-level function
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

main() {
  // add interceptors
  //dio.interceptors.add(CookieManager(CookieJar()));
  dio.interceptors.add(LogInterceptor());
  //(dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  dio.options.receiveTimeout = 15000;
//  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//      (client) {
//    client.findProxy = (uri) {
//      //proxy to my PC(charles)
//      return "PROXY 10.1.10.250:8888";
//    };
//  };

  // await initServices();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(getMaterialApp());
}

getMaterialApp() {
  // await StorageUtil().init();
  return GetMaterialApp(
    builder: EasyLoading.init(),
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.initial,
    getPages: AppPages.routes,
    unknownRoute: AppPages.unknownRoute,
  );
}

// Future<void> initServices() async {
//   print('starting services ...');
//   // await Get.putAsync(() => GlobalConfigService().init());
//   await Global.init();
//   // await Get.putAsync(() => GlobalConfigService().init());
//   // // await Get.putAsync(SettingsService()).init();
//   print('All services started...');
// }
