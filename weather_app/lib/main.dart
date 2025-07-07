import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/Views/home_view.dart';
//import 'package:weather_app/models/weather_model.dart';

// Entry point
void main() {
  runApp(const WeatherApp());
}

// Top-level widget: provides the cubit
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const WeatherAppContent(),
    );
  }
}

// Rebuilds MaterialApp when the weather changes
class WeatherAppContent extends StatelessWidget {
  const WeatherAppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        final weatherModel = context.read<GetWeatherCubit>().weatherModel;
        final themeColor = getThemeColor(weatherModel?.weatherCond);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: themeColor,
            appBarTheme: AppBarTheme(
              backgroundColor: themeColor, // ✅ Explicitly set AppBar color
              foregroundColor: Colors.black// for text/icons
            ),
          ),
          home: const HomeView(),
        );
      },
    );
  }
}

// Theme color logic
MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.teal;

  final c = condition.toLowerCase();

  if (c.contains("sunny") || c.contains("clear")) {
    return Colors.orange;
  } else if (c.contains("cloud")) {
    return Colors.blueGrey;
  } else if (c.contains("mist") || c.contains("fog")) {
    return Colors.grey;
  } else if (c.contains("rain") ||
      c.contains("drizzle") ||
      c.contains("shower")) {
    return Colors.blue;
  } else if (c.contains("snow") ||
      c.contains("blizzard") ||
      c.contains("ice pellets")) {
    return Colors.lightBlue;
  } else if (c.contains("thunder")) {
    return Colors.deepPurple;
  } else if (c.contains("sleet")) {
    return Colors.indigo;
  } else if (c.contains("overcast")) {
    return Colors.brown;
  } else {
    return Colors.teal;
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Views/home_view.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCond,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home:const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.teal;
  final c = condition.toLowerCase();

  if (c.contains("sunny") || c.contains("clear")) {
    return Colors.orange;
  } else if (c.contains("cloud")) {
    return Colors.blueGrey;
  } else if (c.contains("mist") || c.contains("fog")) {
    return Colors.grey;
  } else if (c.contains("rain") ||
      c.contains("drizzle") ||
      c.contains("shower")) {
    return Colors.blue;
  } else if (c.contains("snow") ||
      c.contains("blizzard") ||
      c.contains("ice pellets")) {
    return Colors.lightBlue;
  } else if (c.contains("thunder")) {
    return Colors.deepPurple;
  } else if (c.contains("sleet")) {
    return Colors.indigo;
  } else if (c.contains("overcast")) {
    return Colors.brown;
  } else {
    // fallback/default
    return Colors.teal;
  }
}*/
