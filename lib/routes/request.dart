import 'package:flutter/material.dart';
import '../http.dart';
import '../pages/mining/mining_data.dart';

class RequestRoute extends StatefulWidget {
  const RequestRoute({Key? key}) : super(key: key);

  @override
  _RequestRouteState createState() => _RequestRouteState();
}

class _RequestRouteState extends State<RequestRoute> {
  String _text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          ElevatedButton(
            child: const Text("Request"),
            onPressed: () {
              // dio.get<String>("http://httpbin.org/get").then((r) {
              //   setState(() {
              //     _text = r.data!;
              //   });
              // });
              dio.get("http://192.168.206.1:8080/eth_hub/app/member/miningData/1").then((value) {
                var data = MiningData.fromJson(value.data);

                setState(() {
                  _text = data.result!.unpaid.toString();
                });
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(_text),
            ),
          )
        ]),
      ),
    );
  }
}
