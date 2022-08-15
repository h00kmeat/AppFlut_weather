import 'dart:math';

import 'package:abs/weather_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:abs/location.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF4BE2E3),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _appBar(),
              ),
              _headerImage(),
              _infoWeather(),
              const SizedBox(
                height: 40,
              ),
              Container(height: 150, child: _listView()),
            ],
          ),
        ),
      ),
    );
  }
}

Row _appBar() {
  String nameCity = 'Omsk';
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: IconButton(
            icon: const Icon(
              MyFlutterApp.location,
              size: 32,
              color: Color(0xFF06070B),
            ),
            onPressed: () {}),
      ),
      Expanded(
        flex: 2,
        child: Text(
          nameCity,
          style: const TextStyle(
            fontSize: 25,
            color: Color(0xFF06070B),
          ),
        ),
      ),
      Expanded(
          flex: 1,
          child: IconButton(
              icon: const Icon(
                Icons.calendar_month,
                size: 35,
                color: Color(0xFF06070B),
              ),
              onPressed: () {})),
    ],
  );
}

Image _headerImage() {
  return const Image(
    image: AssetImage('assets/images/cloudy.png'),
    width: double.infinity,
    height: 240,
  );
}

Column _infoWeather() {
  return Column(
    children: [
      const Text(
        'Cloudy',
        style: TextStyle(fontSize: 24, color: Color(0xFF405C63)),
      ),
      const Text(
        '19°C',
        style: TextStyle(fontSize: 80, color: Color(0xFF405C63)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    WeatherIcon.wind,
                    color: Color(0xFF405C63),
                    size: 27,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '4 m/sec',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            child: Row(
              children: const [
                Icon(
                  WeatherIcon.rain_inv,
                  color: Color(0xFF405C63),
                  size: 18,
                ),
                SizedBox(
                  width: 13,
                ),
                Text('87 %', style: TextStyle(fontSize: 15))
              ],
            ),
          ),
        ],
      )
    ],
  );
}

Widget _listView() {

  List<IconData> icons = [
    Icons.wb_cloudy,
    Icons.wb_cloudy_outlined,
    Icons.wb_sunny,
  ];
  int seed = Random().nextInt(10000);
  return ListView.separated(

    scrollDirection: Axis.horizontal,
    itemCount: 7,
    itemBuilder: (context, index) {
      var random = Random(seed) ;
      seed= random.nextInt(10000);
      int gradus = random.nextInt(41);
      var icon = gradus>23 ?  icons[2] :  icons[random.nextInt(icons.length-1)];

      return Chip(
        label: Text('$gradus °C'),
        padding: EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 60),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color(0xFF66E7DF),
        avatar: Icon(icon),
      );
    },
    separatorBuilder: (context, index) => Container(width: 8),
  );
}
