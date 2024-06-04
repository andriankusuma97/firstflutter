import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class PieChart extends StatefulWidget {
  const PieChart({
    super.key,
    this.chartData,
  });

  final List<ChartData>? chartData;

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, Color.fromRGBO(9, 0, 136, 1)),
      ChartData('Steve', 38, Color.fromRGBO(147, 0, 119, 1)),
      ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
      ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1)),
      ChartData('Others', 52, Colors.red),
      ChartData('Others', 52, Colors.black26),
      ChartData('Others', 52, Colors.lightGreen),
    ];
    return SfCircularChart(
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
      // Renders doughnut chart
      DoughnutSeries<ChartData, String>(
        dataSource: chartData,
        pointColorMapper: (ChartData data, _) => data.color,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        radius: '100%',
        innerRadius: '50%',
        explode: true,
        explodeOffset: '5%',
        strokeWidth: 1,
        strokeColor: Colors.white,
        enableTooltip: true,
        cornerStyle: CornerStyle.bothCurve,

      )
    ]);
  }
}
