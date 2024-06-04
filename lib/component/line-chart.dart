import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';




class LineData {
  LineData(this.x, this.y);
  final int x;
  final double? y;
}

class LineChart extends StatefulWidget {
  const LineChart({
    super.key,
    required this.inputData,
  });
  final  List<LineData> inputData;

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  
  
  

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(series: <CartesianSeries>[
      // Renders spline chart
      SplineSeries<LineData, int>(
          dataSource: widget.inputData,
          xValueMapper: (LineData data, _) => data.x,
          yValueMapper: (LineData data, _) => data.y)
    ]);
  }
}
