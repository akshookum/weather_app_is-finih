import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_kurs12/modules/home/view/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      // home: HomeFuture(),
    );
  }
}
