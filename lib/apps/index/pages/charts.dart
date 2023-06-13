import 'package:flutter/material.dart';

import 'barchart.dart';
import 'chartFive.dart';
import 'chartFour.dart';
import 'chartOne.dart';
import 'chartSix.dart';
import 'chartThree.dart';
import 'chartTwo.dart';
import 'piechart.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: buildGridView(),
    );
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 4,
      children: const [
        Barchart(),
        Piechart(),
        ChartOne(),
        ChartTwo(),
        ChartThree(),
        ChartFour(),
        ChartFive(),
        ChartSix(),
      ],
    );
  }
}
