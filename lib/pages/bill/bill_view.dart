import 'dart:math';

import 'package:eth_hub_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bill_logic.dart';

class BillPage extends StatelessWidget {
  final logic = Get.put(BillLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('账单'),
        backgroundColor: AppColors.bgColor,
      ),
      body: Obx(() => ListView.separated(
            itemCount: logic.data.value.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${logic.data.value[index].currency}",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        Text(
                          ((logic.data.value[index].amount ?? 0) > 0 ? "+" : "") + "${logic.data.value[index].amount}",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: (logic.data.value[index].amount ?? 0) > 0 ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${logic.data.value[index].createTime}",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 11, color: Colors.grey),
                        ),
                        Text(
                          logic.translateType(logic.data.value[index].type),
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 11, color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
              );
            },
          )),
    );
  }
}
