import 'dart:convert';

import 'package:covid19/models/country_model.dart';
import 'package:covid19/models/gobal_modal.dart';
import 'package:covid19/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchWorldWideData(context);
    });
  }

  void fetchWorldWideData(BuildContext context) async {
    var response = await http.get('https://api.covid19api.com/summary');

    if (response.statusCode == 200 &&
        response.body != 'You have reached maximum request limit.') {
      var data = json.decode(response.body);

      if (data['Global'] != null &&
          data['Global'].length > 0 &&
          data['Countries'] != null &&
          data['Countries'].length > 0 &&
          data['Date'] != null) {
        globalData = new Global.fromJson(data['Global']);
        globalData.lastUpdated = data['Date'];

        for (var country in data['Countries']) {
          Country newCountry = Country.fromJson(country);
          countries.add(newCountry);
        }

        mostAffectedCountries = countries;
        mostAffectedCountries
            .sort((a, b) => b.totalConfirmed.compareTo(a.totalConfirmed));
        mostAffectedCountries = mostAffectedCountries.getRange(0, 5).toList();

        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        fetchWorldWideData(context);
      }
    } else {
      fetchWorldWideData(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF11259f), Color(0xFF2f77c7)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Covid-19",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 65,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Everything you need to know!",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
