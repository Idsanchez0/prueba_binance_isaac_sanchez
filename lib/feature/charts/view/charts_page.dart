import 'dart:convert';
import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:prueba_binance_isaac_sanchez/core/network/network.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/design/templates/loader/loader.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/utils/paths/images_utils.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/utils/size/size_config.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../core/ui/utils/routes/routes.dart';
import '../../../core/ui/design/templates/headers/text_icon_header.dart';
import '../widgets/chart_widget.dart';

class ChartsPage extends StatefulWidget {
  final String page;
  const ChartsPage({super.key, required this.page});
  @override
  State<ChartsPage> createState() => _ChartsPage();
}

class _ChartsPage extends State<ChartsPage> {
  final _globalKey = GlobalKey<ScaffoldState>();
  dynamic data, dataEtheur;
  List<FlSpot> flData = [];
  double counter = 0;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() async {
    final wsUrl = Uri.parse(
        '${network.urlWebSocket}/ws/${widget.page.toString().toLowerCase()}@trade');
    final channel = WebSocketChannel.connect(wsUrl);
    channel.sink.close();
    super.dispose();
  }

  getData() async {
    await Future.delayed(const Duration(milliseconds: 0));
    final wsUrl = Uri.parse(
        '${network.urlWebSocket}/ws/${widget.page.toString().toLowerCase()}@trade');
    final channel = WebSocketChannel.connect(wsUrl);
    await channel.ready;
    setState(() {
      data = null;
    });
    log('empieza a escuchar');
    channel.stream.listen((message) {
      log(message.toString());
      data = jsonDecode(message);
      addToList();
    });
  }

  addToList() {
    setState(() {
      counter++;
    });
    double price = double.parse(data?['p'] ?? '500');
    flData.add(FlSpot(counter, price));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        setState(() {
          data = null;
        });
        () => routes.mainExplore(context: context);
        return;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          key: _globalKey,
          appBar: TextIconHeader(
            title: widget.page,
            onTap: () {
              setState(() {
                data = null;
              });
              final wsUrl = Uri.parse(
                  '${network.urlWebSocket}/ws/${widget.page.toString().toLowerCase()}@trade');
              final channel = WebSocketChannel.connect(wsUrl);
              channel.sink.close();
              routes.mainExplore(context: context);
            },
          ),
          body: Container(
              height: 95 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(imagesUtils.panal), fit: BoxFit.cover)),
              child: SafeArea(
                  top: true,
                  bottom: false,
                  right: true,
                  child: Stack(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 3 * SizeConfig.heightMultiplier),
                          color: Colors.transparent,
                          width: 95 * SizeConfig.widthMultiplier,
                          child: ChartWidget(
                            flData: flData,
                            data: double.parse(
                                data == null ? '0' : data['p'].toString()),
                          )),
                      if (data == null) ...[
                        Container(
                          color: Colors.black.withOpacity(.3),
                          child: const Loader(),
                        )
                      ]
                    ],
                  )))),
    );
  }
}
