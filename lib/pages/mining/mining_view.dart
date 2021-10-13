import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mining_logic.dart';

class MiningPage extends StatelessWidget {
  final logic = Get.put(MiningLogic());

  MiningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eth Hub',
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1b1e44),
        actions: [
          TextButton(
            onPressed: () {
              logic.handleBillBtnTap();
            },
            child: Text(
              '账单',
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: buildBody(),
      backgroundColor: const Color(0xFF1b1e44),
    );
  }

  buildBody() {
    var cellWidth = 100.0;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 20.0, right: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: 440,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      // color: Colors.blueAccent,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: MoreGradientColors.instagram,
                        stops: [0.3, 0.6, 0.9],
                      ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                    ),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 4.0, bottom: 4.0),
                          child: SvgPicture.asset(
                            'assets/images/eth.svg',
                            height: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('ETH',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: GoogleFonts.roboto().fontFamily,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      '待入账收益',
                      style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Container(
                    // color: Colors.pink,
                    margin: const EdgeInsets.only(top: 1.0, left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Obx(() => Text.rich(TextSpan(children: [
                              TextSpan(text: logic.convertEthAmount(logic.data.value.unpaid ?? 0), style: GoogleFonts.roboto(fontSize: 36, color: Colors.black)),
                              TextSpan(text: ' ETH', style: GoogleFonts.roboto(fontSize: 20, color: Colors.black)),
                              TextSpan(text: ' ≈ ¥', style: GoogleFonts.roboto(fontSize: 20, color: Colors.blueGrey)),
                              TextSpan(text: logic.convertCny(logic.data.value.unpaid ?? 0), style: GoogleFonts.roboto(fontSize: 20, color: Colors.blueGrey)),
                            ]))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        // color: Colors.green.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              height: 80,
                              width: cellWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '预计日收益',
                                    style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Obx(() => Text('${logic.convertEthAmount(logic.data.value.coinsPerDay ?? 0)} ETH', style: GoogleFonts.roboto(color: Colors.black, fontSize: 16))),
                                  Obx(() => Text('≈ ¥ ${logic.convertCny(logic.data.value.coinsPerDay ?? 0)}', style: GoogleFonts.roboto(color: Colors.blueGrey, fontSize: 12))),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              height: 80,
                              width: cellWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '钱包余额',
                                    style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Obx(() => Text('${logic.convertEthAmount(logic.data.value.balance ?? 0)} ETH', style: GoogleFonts.roboto(color: Colors.black, fontSize: 16))),
                                  Obx(() => Text('≈ ¥ ${logic.convertCny(logic.data.value.balance ?? 0)}', style: GoogleFonts.roboto(color: Colors.blueGrey, fontSize: 12))),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              height: 80,
                              width: cellWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '总收益',
                                    style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Obx(() =>
                                      Text('${logic.convertEthAmount(logic.data.value.totalEarnings ?? 0)}  ETH', style: GoogleFonts.roboto(color: Colors.black, fontSize: 16))),
                                  Obx(() => Text('≈ ¥ ${logic.convertCny(logic.data.value.totalEarnings ?? 0)}', style: GoogleFonts.roboto(color: Colors.blueGrey, fontSize: 12))),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        // color: Colors.green.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              height: 60,
                              width: cellWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '实时算力',
                                    style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Obx(() => Text('${logic.data.value.currentHashrate ?? 0} GH/s', style: GoogleFonts.roboto(color: Colors.black, fontSize: 16))),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              height: 60,
                              width: cellWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '平均算力',
                                    style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Obx(() => Text('${logic.data.value.averageHashrate ?? 0}  GH/s', style: GoogleFonts.roboto(color: Colors.black, fontSize: 16))),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              height: 60,
                              width: cellWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '报告算力',
                                    style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Obx(() => Text('${logic.data.value.reportedHashrate ?? 0}  GH/s', style: GoogleFonts.roboto(color: Colors.black, fontSize: 16))),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        // color: Colors.green.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              height: 60,
                              width: cellWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '有效份额',
                                    style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Obx(() => Text('${logic.data.value.validShares ?? 0}', style: GoogleFonts.roboto(color: Colors.black, fontSize: 16))),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              height: 60,
                              width: cellWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '延迟份额',
                                    style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Obx(() => Text('${logic.data.value.staleShares ?? 0}', style: GoogleFonts.roboto(color: Colors.black, fontSize: 16))),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              height: 60,
                              width: cellWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '无效份额',
                                    style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Obx(() => Text('${logic.data.value.invalidShares ?? 0}', style: GoogleFonts.roboto(color: Colors.black, fontSize: 16))),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 15, left: 8, right: 8),
                  //   // width: 150,
                  //   child: LinearPercentIndicator(
                  //     // width: MediaQuery.of(context).size.width - 150,
                  //     animation: true,
                  //     lineHeight: 8.0,
                  //     animationDuration: 2000,
                  //     percent: 0.9,
                  //     // center: Text("90.0%"),
                  //     linearStrokeCap: LinearStrokeCap.roundAll,
                  //     progressColor: Colors.greenAccent,
                  //     backgroundColor: Colors.redAccent,
                  //     trailing: Text.rich(TextSpan(children: [
                  //       TextSpan(text: "88 ", style: GoogleFonts.roboto(fontSize: 16, color: Colors.green)),
                  //       TextSpan(text: "/ 0", style: GoogleFonts.roboto(fontSize: 16, color: Colors.redAccent)),
                  //     ])),
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.only(top: 8, left: 15, right: 15),
                    child: Obx(
                      () => GFProgressBar(
                        lineHeight: 6,
                        percentage: logic.percent.value,
                        backgroundColor: Colors.red,
                        progressBarColor: Colors.greenAccent,
                        trailing: Text.rich(TextSpan(children: [
                          TextSpan(text: '${logic.data.value.activeWorkers ?? 0}', style: GoogleFonts.roboto(fontSize: 16, color: Colors.green)),
                          TextSpan(text: ' / ${logic.data.value.inactiveWorkers ?? 0}', style: GoogleFonts.roboto(fontSize: 16, color: Colors.redAccent)),
                        ])),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Row(
          //   children: [
          //     TextField(
          //       // autofocus: true,
          //       controller: logic.accountController,
          //       keyboardType: TextInputType.url,
          //       decoration: InputDecoration(
          //         hintText: 'account',
          //         contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
          //         border: InputBorder.none,
          //       ),
          //     ),
          //     GFButton(
          //       text: 'refresh',
          //       onPressed: () {
          //         logic.getData();
          //       },
          //     ),
          //   ],
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          //   child: TextField(
          //     controller: logic.accountController,
          //   ),
          // ),
          buildSearch(),
        ],
      ),
    );
  }

  buildSearch() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 20.0, right: 20.0),
      child: TextField(
        style: GoogleFonts.montserrat(fontSize: 12),
        controller: logic.accountController,
        decoration: InputDecoration(
          hintText: 'Account',
          // fillColor: Color(0xFF2A2D3E),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: InkWell(
            onTap: () {
              logic.getData();
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0 / 2),
              decoration: const BoxDecoration(
                color: Color(0xFF2697FF),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SvgPicture.asset('assets/images/Search.svg'),
            ),
          ),
        ),
      ),
    );
  }
}
