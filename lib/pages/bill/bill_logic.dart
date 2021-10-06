import 'package:eth_hub_app/utils/storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http.dart';
import 'bill_data.dart';

class BillLogic extends GetxController {
  var data = Rx<List<Result>>(<Result>[]);

  getBillData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var account = prefs.getString(StoreKey.account);
    if (account == null) {
      EasyLoading.showError("请输入帐号!");
      return;
    }

    httpGet(account);
  }

  void httpGet(String account) {
    // dio.get('http://www.ethhub.vip:8080/eth_hub/app/member/miningData/' + account).then((value) {
    dio.get('http://192.168.206.1:8080/eth_hub/app/member/bill/' + account).then((value) {
      var res = BillData.fromJson(value.data);
      var bool = res.success ?? false;
      if (!bool) {
        EasyLoading.showError(res.message ?? "Error");
      }

      data.value = res.result!;
    });
  }

  translateType(String? type) {
    if (type == null) {
      return 'Bill';
    } else if (type == 'SETTLE') {
      return '矿工收益';
    } else if (type == 'SPARK-BALANCE') {
      return '星火结余';
    } else if (type == 'CASHOUT') {
      return '提现';
    }
    return type;
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
