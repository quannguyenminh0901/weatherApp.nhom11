import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/templates/Congcu/Location.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:weatherapp/utils/color_utils.dart';

class BarItemPage extends StatefulWidget {
  @override
  _BarItemPageState createState() => _BarItemPageState();
}

class _BarItemPageState extends State<BarItemPage> {
  final _cityController = TextEditingController();
  double? _temperature;
  String? _city;
  String? _country;
  String? _description;

  List<Map<String, dynamic>>? _weatherData;

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  void _getLocationData() async {
    final cityName = _cityController.text;
    final url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/forecast',
      {
        'q': cityName,
        'appid': 'e0ea7c2430957c0b90c7a6375a5f8cba',
        'lang': 'vi'
      },
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        _temperature = data['list'][0]['main']['temp'];
        _city = data['city']['name'];
        _country = data['city']['country'];
        _description = data['list'][0]['weather'][0]['description'];

        _weatherData = [
          {
            'day': 'Thứ ${DateTime.now().add(Duration(days: 1)).weekday}',
            'temp': data['list'][0]['main']['temp'],
            'description': data['list'][0]['weather'][0]['description'],
          },
          {
            'day': 'Thứ ${DateTime.now().add(Duration(days: 2)).weekday}',
            'temp': data['list'][1]['main']['temp'],
            'description': data['list'][1]['weather'][0]['description'],
          },
          {
            'day': 'Thứ ${DateTime.now().add(Duration(days: 3)).weekday}',
            'temp': data['list'][2]['main']['temp'],
            'description': data['list'][2]['weather'][0]['description'],
          },
          {
            'day': 'Thứ ${DateTime.now().add(Duration(days: 4)).weekday}',
            'temp': data['list'][3]['main']['temp'],
            'description': data['list'][3]['weather'][0]['description'],
          },
          {
            'day': 'Thứ ${DateTime.now().add(Duration(days: 5)).weekday}',
            'temp': data['list'][4]['main']['temp'],
            'description': data['list'][4]['weather'][0]['description'],
          },
        ];
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width:  MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  hexStringToColor("CB2B93"),
                  hexStringToColor("9546C4"),
                  hexStringToColor("5E61F4")
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      hintText:
                          'Nhập tên thành phố',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                      horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _getLocationData,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // đổi màu nền của nút
                      onPrimary: Colors.black, // đổi màu chữ trên nút
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                            color: Colors.black), // đổi màu viền của nút
                      ),
                    ),
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, //boi dam chu
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Dự báo thời tiết',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 350.0,
                    child: CarouselSlider.builder(
                      itemCount: _weatherData?.length ?? 0,
                      itemBuilder: (BuildContext context, int index, int) {
                        final day = _weatherData![index]['day'];

                        final temp = (_weatherData![index]['temp'] - 273.15)
                            .toStringAsFixed(2);
                        final description = _weatherData![index]['description'];
                        return Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.01
                            ),
                            child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20
                              ),
                              side: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    day,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  ListTile(
                                    leading: Icon(Icons.location_city_outlined),
                                    title: Text(
                                      'Thành phố',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text('$_city, $_country'),
                                  ),
                                  SizedBox(height: 8.0),
                                  ListTile(
                                    leading: Icon(Icons.thermostat_outlined),
                                    title: Text(
                                      'Nhiệt độ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text('$temp °C'),
                                  ),
                                  SizedBox(height: 8.0),
                                  ListTile(
                                    leading: Icon(Icons.description_outlined),
                                    title: Text(
                                      'Chú thích',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text('$description'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 367.0,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
