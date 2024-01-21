import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';

class StatScreen extends StatefulWidget {
  StatScreen({super.key});

  final shadowColor = AppColor.lightColor1;

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  List<_BarData> dataList = [
    
  ];
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
    String label
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: widget.shadowColor,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        dataList = [
          const _BarData(AppColor.error, 2300, 2000, 'mon'),
          const _BarData(AppColor.error, 2400, 2000, 'tue'),
          const _BarData(AppColor.success, 1200, 2000, 'wed'),
          const _BarData(AppColor.success, 1500, 2000, 'thu'),
          const _BarData(AppColor.success, 1300.5, 2000, 'fri'),
          const _BarData(AppColor.success, 1203, 2000, 'sat'),
          const _BarData(AppColor.success, 1600, 2000, 'sun'),
        ];
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text('Bảng đánh giá Tuần 1 Năm 2024', style: Theme.of(context).textTheme.titleLarge,),
          SizedBox(height: 30,),
          AspectRatio(
            aspectRatio: 1,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                borderData: FlBorderData(
                  show: true,
                  border: const Border.symmetric(
                    horizontal:  BorderSide(
                      color: AppColor.borderColor,
                    ),
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: AxisTitles(
                    drawBelowEverything: true,
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          overflow: TextOverflow.ellipsis,
                          value.toInt().toString(),
                          textAlign: TextAlign.left,
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 36,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(dataList[index].label).tr()
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => const FlLine(
                    color: AppColor.borderColor,
                    strokeWidth: 1,
                  ),
                ),
                barGroups: dataList.asMap().entries.map((e) {
                  final index = e.key;
                  final data = e.value;
                  return generateBarGroup(
                    index,
                    data.color,
                    data.value,
                    data.shadowValue,
                    data.label,
                  );
                }).toList(),
                maxY: 3000,
              ),
            ),
          ),
          SizedBox(height: 50,),
          Column(children: [
            Row(
              children: [
                Text('Lượng calories nạp trong tuần:', style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(width: 10,),
                Text('12304 calories', style: AppText.textSuccess,)
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Bạn đã giảm được:', style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(width: 10,),
                Text('~2.4 kg', style: AppText.textSuccess,)
              ],
            )
          ])
        ],
      ),
    );
  }
}

class _BarData {
  const _BarData(this.color, this.value, this.shadowValue, this.label);
  final Color color;
  final double value;
  final double shadowValue;
  final String label;
}
