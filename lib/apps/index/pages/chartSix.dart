import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class ChartSix extends StatefulWidget {
  const ChartSix({super.key});

  @override
  State<ChartSix> createState() => _ChartSixState();
}

class _ChartSixState extends State<ChartSix> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartPie(
          data: const [
            {'domain': 'Flutter', 'measure': 28},
            {'domain': 'React Native', 'measure': 27},
            {'domain': 'Ionic', 'measure': 20},
            {'domain': 'Cordova', 'measure': 15},
          ],
          fillColor: (pieData, index) {
            switch (pieData['domain']) {
              case 'Flutter':
                return Colors.blue;
              case 'React Native':
                return Colors.blueAccent;
              case 'Ionic':
                return Colors.lightBlue;
              default:
                return Colors.orange;
            }
          },
          pieLabel: (pieData, index) {
            return "${pieData['domain']}:\n${pieData['measure']}%";
          },
          labelPosition: PieLabelPosition.outside,
        ),
      ),
    );
  }
}
