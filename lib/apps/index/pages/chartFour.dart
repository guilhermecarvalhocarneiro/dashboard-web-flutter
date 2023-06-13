import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class ChartFour extends StatefulWidget {
  const ChartFour({super.key});

  @override
  State<ChartFour> createState() => _ChartFourState();
}

class _ChartFourState extends State<ChartFour> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartLine(
          data: const [
            {
              'id': 'Line',
              'data': [
                {'domain': 0, 'measure': 4.1},
                {'domain': 2, 'measure': 4},
                {'domain': 3, 'measure': 6},
                {'domain': 4, 'measure': 1},
              ],
            },
          ],
          lineColor: (lineData, index, id) => Colors.amber,
        ),
      ),
    );
  }
}
