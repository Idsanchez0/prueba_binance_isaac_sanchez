import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/utils/paths/colors_utils.dart';

class ChartWidget extends StatefulWidget {
  final dynamic flData;
  final double data;
  const ChartWidget({super.key, required this.flData, required this.data});
  @override
  State<ChartWidget> createState() => _ChartWidget();
}

class _ChartWidget extends State<ChartWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log(widget.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
          minX: 0,
          maxX:
              widget.flData.isEmpty ? 5 : widget.flData.length.toDouble() + 10,
          minY: widget.data > 1000
              ? widget.data > 10000
                  ? 50000
                  : 2850
              : -0.5,
          maxY: widget.data > 1000
              ? widget.data > 10000
                  ? 70000
                  : 3200
              : 3,
          lineTouchData: const LineTouchData(enabled: true),
          clipData: const FlClipData.all(),
          backgroundColor: Colors.black,
          titlesData: const FlTitlesData(
              rightTitles: AxisTitles(), topTitles: AxisTitles()),
          lineBarsData: [
            LineChartBarData(
              spots: widget.flData,
              color: colors.warning500,
            )
          ]),
      curve: Curves.linear,
    );
  }
}
