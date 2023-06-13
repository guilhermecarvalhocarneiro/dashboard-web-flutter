import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class ChartThree extends StatefulWidget {
  const ChartThree({super.key});

  @override
  State<ChartThree> createState() => _ChartThreeState();
}

class _ChartThreeState extends State<ChartThree> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartBar(
          data: const [
            {
              'id': 'Bar',
              'data': [
                {'domain': '2020', 'measure': 3},
                {'domain': '2021', 'measure': 4},
                {'domain': '2022', 'measure': 6},
                {'domain': '2023', 'measure': 0.3},
              ],
            },
          ],
          domainLabelPaddingToAxisLine: 16,
          axisLineTick: 2,
          axisLinePointTick: 2,
          axisLinePointWidth: 10,
          axisLineColor: Colors.green,
          measureLabelPaddingToAxisLine: 16,
          barColor: (barData, index, id) => Colors.green,
          showBarValue: true,
        ),
      ),
    );
  }
}
