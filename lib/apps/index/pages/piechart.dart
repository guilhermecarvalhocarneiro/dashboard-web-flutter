import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class Piechart extends StatefulWidget {
  const Piechart({super.key});

  @override
  State<Piechart> createState() => _PiechartState();
}

class _PiechartState extends State<Piechart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartGauge(
          data: const [
            {'domain': 'Flutter', 'measure': 28},
            {'domain': 'React Native', 'measure': 27},
            {'domain': 'Ionic', 'measure': 20},
            {'domain': 'Cordova', 'measure': 15},
          ],
          fillColor: (pieData, index) => Colors.blue,
        ),
      ),
    );
  }
}
