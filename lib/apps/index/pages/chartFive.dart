import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class ChartFive extends StatefulWidget {
  const ChartFive({super.key});

  @override
  State<ChartFive> createState() => _ChartFiveState();
}

class _ChartFiveState extends State<ChartFive> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: DChartLine(
        lineColor: (lineData, index, id) {
          return id == 'Line 1' ? Colors.blue : Colors.amber;
        },
        data: const [
          {
            'id': 'Line 1',
            'data': [
              {'domain': 1, 'measure': 3},
              {'domain': 2, 'measure': 3},
              {'domain': 3, 'measure': 4},
              {'domain': 4, 'measure': 6},
              {'domain': 5, 'measure': 0.3},
            ],
          },
          {
            'id': 'Line 2',
            'data': [
              {'domain': 1, 'measure': 4},
              {'domain': 2, 'measure': 5},
              {'domain': 3, 'measure': 2},
              {'domain': 4, 'measure': 1},
              {'domain': 5, 'measure': 2.5},
            ],
          },
        ],
        includePoints: true,
      ),
    );
  }
}
