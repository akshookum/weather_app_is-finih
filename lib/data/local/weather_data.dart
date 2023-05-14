class WeatherData {
  static calculteWeather(double kelvin) {
    final data = (kelvin - 273.15).toStringAsFixed(0);
    return data;
  }

  static String getDescription(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return ' Жылуу🧣 кийинишин керек🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  static String getWeatherIcon(double temp) {
    if (temp > 20 || temp > 19 || temp > 18) {
      return '☀️';
    } else if (temp >= 10) {
      return '⛅';
    } else if (temp < 0 - 10) {
      return '🌧';
    } else if (temp < 20) {
      return '☔️';
    } else {
      return '🤷';
    }
  }
}
