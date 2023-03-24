import 'dart:ui';

import 'healthPage.dart';
import 'package:charts_flutter/flutter.dart' as charts;

final List<SubscriberSeries> data = [
  SubscriberSeries(
    year: "S",
    subscribers: 70,
    barColor: charts.ColorUtil.fromDartColor(Color(0xFFFF7D7D))
  ),
  SubscriberSeries(
    year: "M",
    subscribers: 56,
      barColor: charts.ColorUtil.fromDartColor(Color(0xFFFF7D7D))
  ),
  SubscriberSeries(
    year: "T",
    subscribers: 90,
      barColor: charts.ColorUtil.fromDartColor(Color(0xFFFF7D7D))
  ),
  SubscriberSeries(
    year: "W",
    subscribers: 80,
      barColor: charts.ColorUtil.fromDartColor(Color(0xFFFF7D7D))
  ),
  SubscriberSeries(
    year: "Th",
    subscribers: 30,
      barColor: charts.ColorUtil.fromDartColor(Color(0xFFFF7D7D))
  ),
  SubscriberSeries(
    year: "F",
    subscribers: 60,
      barColor: charts.ColorUtil.fromDartColor(Color(0xFFFF7D7D))
  ),
  SubscriberSeries(
    year: "Sa",
    subscribers: 50,
      barColor: charts.ColorUtil.fromDartColor(Color(0xFFFF7D7D))
  ),

];