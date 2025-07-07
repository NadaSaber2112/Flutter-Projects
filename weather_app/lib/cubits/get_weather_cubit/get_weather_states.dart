import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class InitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
 final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailurState extends WeatherStates {}
