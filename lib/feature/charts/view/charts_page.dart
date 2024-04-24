import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:prueba_binance_isaac_sanchez/core/network/network.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/design/templates/footers/footer.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/utils/paths/images_utils.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/utils/size/size_config.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../core/ui/utils/routes/routes.dart';
import '../widgets/chart_widget.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({super.key});
  @override
  State<ChartsPage> createState() => _ChartsPage();
}

class _ChartsPage extends State<ChartsPage> {
  final _globalKey = GlobalKey<ScaffoldState>();
  dynamic data;
  List<FlSpot> flData = [];
  double counter = 0;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final wsUrl = Uri.parse('${network.urlWebSocket}/ws/etheur@trade');
    final channel = WebSocketChannel.connect(wsUrl);
    await channel.ready;
    channel.stream.listen((message) {
      data = jsonDecode(message);
      addToList();
    });
  }

  addToList() {
    setState(() {
      counter++;
    });
    double price = double.parse(data?['p'] ?? '2800');
    flData.add(FlSpot(counter, price));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        () => routes.mainExplore(context: context);
        return;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          key: _globalKey,
          bottomNavigationBar: const Footer(page: 'chart'),
          body: Container(
              height: double.infinity,
              width: 95 * SizeConfig.widthMultiplier,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(imagesUtils.panal), fit: BoxFit.cover)),
              child: SafeArea(
                  top: true,
                  bottom: true,
                  right: true,
                  child: ChartWidget(flData: flData)))),
    );
  }
}
