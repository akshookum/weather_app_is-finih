import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_kurs12/constans/api_keys/api_keys.dart';
import 'package:weather_app_kurs12/data/local/weather_data.dart';
import 'package:weather_app_kurs12/modules/home/services/geo_location_service.dart';

class HomeController extends GetxController {
  RxString cityName = ''.obs;
  RxString tempreture = ''.obs;
  RxString icons = ''.obs;
  RxBool isLoading = false.obs;
  RxString country = ''.obs;
  RxString description = ''.obs;

  @override
  void onInit() {
    showWeatherByLocation1();
    super.onInit();
  }

  Future<void> showWeatherByLocation1() async {
    final position = await GeoLocationService.getPosition();
    await getWeather(position);
  }

  Future<void> getWeather(Position position) async {
    //   isLoading = true;

    try {
      final client = http.Client();
      final url =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=${ApiKeys.myApiKey}';
      Uri uri = Uri.parse(url);
      final joop = await client.get(uri);
      final jsonJoop = jsonDecode(joop.body);
      cityName.value = jsonJoop['name'];
      final double kelvin = jsonJoop['main']['temp'];
      tempreture.value = WeatherData.calculteWeather(kelvin);
      country.value = jsonJoop['sys']['country'];
      description.value =
          WeatherData.getDescription(double.parse(tempreture.value));
      icons.value = WeatherData.getWeatherIcon(double.parse(tempreture.value));

      log('city name ===> ${jsonJoop['name']}');
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }

  Future<void> getSearchedCityName(String typedCityName) async {
    final client = http.Client();
    try {
      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$typedCityName&appid=${ApiKeys.myApiKey}');
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log('data ===> ${response.body}');
        final data = jsonDecode(response.body);
        // log('data ===> ${data}');
        cityName.value = data['name'];
        country.value = data['sys']['country'];
        final kelvin = data['main']['temp'];
        tempreture.value = WeatherData.calculteWeather(kelvin);
        description.value =
            WeatherData.getDescription(double.parse(tempreture.value));
        icons.value =
            WeatherData.getWeatherIcon(double.parse(tempreture.value));
      }
    } catch (e) {}
  }
}
