import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/utils/paths/colors_utils.dart';

class ChartWidget extends StatefulWidget {
  final dynamic flData;
  const ChartWidget({super.key, this.flData});
  @override
  State<ChartWidget> createState() => _ChartWidget();
}

class _ChartWidget extends State<ChartWidget> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
          minX: 1,
          maxX:
              widget.flData.isEmpty ? 5 : widget.flData.length.toDouble() + 10,
          minY: 2800,
          maxY: 3000,
          lineTouchData: const LineTouchData(enabled: false),
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
