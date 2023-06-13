import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class ChartOne extends StatefulWidget {
  const ChartOne({super.key});

  @override
  State<ChartOne> createState() => _ChartOneState();
}

class _ChartOneState extends State<ChartOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartGauge(
          data: const [
            {'domain': 'Off', 'measure': 30},
            {'domain': 'Warm', 'measure': 30},
            {'domain': 'Hot', 'measure': 30},
          ],
          fillColor: (pieData, index) {
            switch (pieData['domain']) {
              case 'Off':
                return Colors.green;
              case 'Warm':
                return Colors.orange;
              default:
                return Colors.red;
            }
          },
          showLabelLine: false,
          pieLabel: (pieData, index) {
            return "${pieData['domain']}";
          },
          labelPosition: PieLabelPosition.inside,
          labelPadding: 0,
          labelColor: Colors.white,
        ),
      ),
    );
  }
}
