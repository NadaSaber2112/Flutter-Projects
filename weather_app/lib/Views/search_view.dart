import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 168, 121, 176),
        title: const Text('Search a City'),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                border: const OutlineInputBorder(),
                fillColor: Colors.purple,
                hintText: 'Enter City Name',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                labelText: 'Search',
                labelStyle: const TextStyle(
                  color: Colors.purple,
                )),
          ),
        ),
      ),
    );
  }
}

//Bloc pattern as statemangment
//create States
// create cubit
//create function
//provide cubit
//integrate cubit
// trigger cubit
