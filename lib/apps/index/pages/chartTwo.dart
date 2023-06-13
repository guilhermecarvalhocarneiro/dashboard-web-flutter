import 'dart:math';

import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class ChartTwo extends StatefulWidget {
  const ChartTwo({super.key});

  @override
  State<ChartTwo> createState() => _ChartTwoState();
}

class _ChartTwoState extends State<ChartTwo> {
  final List ranking = [
    {'class': 'A', 'total': 23},
    {'class': 'B', 'total': 14},
    {'class': 'C', 'total': 8},
    {'class': 'D', 'total': 7},
    {'class': 'E', 'total': 21},
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: DChartBarCustom(
        loadingDuration: const Duration(milliseconds: 1500),
        showLoading: true,
        valueAlign: Alignment.topCenter,
        showDomainLine: true,
        showDomainLabel: true,
        showMeasureLine: true,
        showMeasureLabel: true,
        spaceDomainLabeltoChart: 10,
        spaceMeasureLabeltoChart: 5,
        spaceDomainLinetoChart: 15,
        spaceMeasureLinetoChart: 20,
        spaceBetweenItem: 16,
        radiusBar: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        measureLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.purple,
        ),
        domainLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.purple,
        ),
        measureLineStyle: const BorderSide(color: Colors.amber, width: 2),
        domainLineStyle: const BorderSide(color: Colors.red, width: 2),
        max: 25,
        listData: List.generate(ranking.length, (index) {
          final Color currentColor = Color((Random().nextDouble() * 0xFFFFFF).toInt());
          return DChartBarDataCustom(
            onTap: () {
              print(
                '${ranking[index]['class']} => ${ranking[index]['total']}',
              );
            },
            elevation: 8,
            value: ranking[index]['total'].toDouble(),
            label: ranking[index]['class'],
            color: currentColor.withOpacity(1),
            splashColor: Colors.blue,
            showValue: ranking[index]['class'] == 'C' ? false : true,
            valueStyle: ranking[index]['class'] == 'A'
                ? const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  )
                : const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
            labelCustom: ranking[index]['class'] == 'B'
                ? Transform.rotate(
                    angle: 5.5,
                    child: const Text('Bagus'),
                  )
                : null,
            valueCustom: ranking[index]['total'] > 20
                ? Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${ranking[index]['total']}',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const Text(
                          '😄',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  )
                : null,
            valueTooltip: '${ranking[index]['total']} Student',
          );
        }),
      ),
    );
  }
}
