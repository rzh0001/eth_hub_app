import 'package:eth_hub_app/routes/app_pages.dart';
import 'package:eth_hub_app/url.dart';
import 'package:eth_hub_app/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http.dart';
import 'mining_data.dart';

class MiningLogic extends GetxController {
  var data = Rx<Result>(Result());
  var code = 0.obs;
  var percent = 1.0.obs;

  final TextEditingController accountController = TextEditingController();

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (accountController.text.isNotEmpty) {
      prefs.setString(StoreKey.account, accountController.text);
      httpGet(accountController.text);
    } else {
      var account = prefs.getString(StoreKey.account);
      if (account == null) {
        if (accountController.text.isEmpty) {
          EasyLoading.showError("请输入帐号!");
          return;
        }
        prefs.setString(StoreKey.account, accountController.text);
        httpGet(accountController.text);
      }
    }

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // print('cache:' + prefs.getString(StoreKey.account).toString());
  }

  void httpGet(String account) {
    dio.get(AppUrl.mining + account).then((value) {
      var res = MiningData.fromJson(value.data);
      var bool = res.success ?? false;
      if (!bool) {
        EasyLoading.showError(res.message ?? "Error");
      }

      code.value = res.code!;
      data.value = res.result!;

      var total = res.result!.workers ?? 1;
      var act = res.result!.activeWorkers ?? 1;

      percent.value = act / total;
    });
  }

  String convertEthAmount(double ethAmount) {
    if (ethAmount > 1000) {
      return ethAmount.toStringAsFixed(1);
    } else if (ethAmount > 100) {
      return ethAmount.toStringAsFixed(2);
    } else if (ethAmount > 10) {
      return ethAmount.toStringAsFixed(3);
    }
    return ethAmount.toString();
  }

  String convertCny(double ethAmount) {
    var value = ethAmount * (data.value.cnyPrice ?? 0);
    if (value > 100000) {
      return value.toStringAsFixed(0);
    }
    return (value).toStringAsFixed(2);
  }

  handleBillBtnTap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var account = prefs.getString(StoreKey.account);
    if (account == null && accountController.text.isEmpty) {
      EasyLoading.showError("请输入帐号!");
      return;
    }
    Get.toNamed(AppRoutes.bill);
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    print('onInit ......');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map? parameters = Get.parameters;
    var account = parameters['id'];
    if (account != null) {
      prefs.setString(StoreKey.account, account);
    } else {
      var cacheAccount = prefs.getString(StoreKey.account);
      if (cacheAccount != null) {
        accountController.value = TextEditingValue(text: cacheAccount);
      }
    }
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();

    print('onReady ......');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var string = prefs.getString(StoreKey.account);
    if (string != null) {
      // accountController.text = string;
      httpGet(string);
    }
  }
}
