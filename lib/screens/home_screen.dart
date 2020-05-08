import 'package:covid19/constants/custom_colors.dart';
import 'package:covid19/models/country_model.dart';
import 'package:covid19/widgets/bottom_navbar_item.dart';
import 'package:covid19/widgets/language_dropdown.dart';
import 'package:covid19/widgets/latest_worldwide_stats.dart';
import 'package:covid19/widgets/self_checkup.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.background,
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // SelfCheckup(),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          CustomColors.link,
                          CustomColors.green.withOpacity(0.8),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF505050).withOpacity(.6),
                          offset: Offset(0, 2),
                          blurRadius: 15,
                          spreadRadius: -5,
                        )
                      ],
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Fight Covid-19',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Get to know about Covid-19',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.notifications,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            LatestWorldWideStats(),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    transform: Matrix4.translationValues(0, -30, 0),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              transform: Matrix4.translationValues(0, 30, 0),
                              height: 200,
                              width: double.infinity,
                              color: Colors.red,
                            ),
                            LanguageDropdown(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: CustomColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 5),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BottomNavBarItem(icon: Icons.home, text: 'Home'),
            BottomNavBarItem(icon: Icons.search, text: 'Search'),
            BottomNavBarItem(
                icon: Icons.account_balance_wallet, text: 'Funding'),
            BottomNavBarItem(icon: Icons.person, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
