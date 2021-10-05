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
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ETH",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    Text(
                      "+10.2647",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2021-10-06 00:00:04",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Colors.grey),
                    ),
                    Text(
                      "矿工收益",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Colors.blueGrey),
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
      ),
    );
  }
}
