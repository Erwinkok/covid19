
import 'package:covid19/constants/custom_colors.dart';
import 'package:covid19/models/gobal_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LatestWorldWideStats extends StatelessWidget {
  final RegExp regex = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  final Function mathFunc = (Match match) => '${match[1]}.';

  LatestWorldWideStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Worldwide',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                text: TextSpan(
                  text:
                      '${DateFormat('MMMM d, y, H:m').format(DateTime.parse(globalData.lastUpdated))}',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: CustomColors.subTitle.withOpacity(.1),
              width: 1,
            ),
            boxShadow: [
              new BoxShadow(
                color: Color(0xff505050).withOpacity(.6),
                offset: Offset(0, 2),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Total Cases',
                          style: TextStyle(
                            color: CustomColors.subTitle,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          '${globalData.totalConfirmed.toString().replaceAllMapped(regex, mathFunc)}',
                          style: TextStyle(
                            color: CustomColors.link,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            text: 'New ',
                            style: TextStyle(
                                color: CustomColors.subTitle,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                            children: [
                              TextSpan(
                                text:
                                    '+${globalData.newConfirmed.toString().replaceAllMapped(regex, mathFunc)}',
                                style: TextStyle(
                                  color: CustomColors.link,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Deaths',
                          style: TextStyle(
                            color: CustomColors.subTitle,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          '${globalData.totalDeaths.toString().replaceAllMapped(regex, mathFunc)}',
                          style: TextStyle(
                            color: CustomColors.red,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            text: 'New ',
                            style: TextStyle(
                                color: CustomColors.subTitle,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                            children: [
                              TextSpan(
                                text:
                                    '+${globalData.newDeaths.toString().replaceAllMapped(regex, mathFunc)}',
                                style: TextStyle(
                                  color: CustomColors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Recovered',
                          style: TextStyle(
                            color: CustomColors.subTitle,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          '${globalData.totalRecovered.toString().replaceAllMapped(regex, mathFunc)}',
                          style: TextStyle(
                            color: CustomColors.green,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            text: 'New ',
                            style: TextStyle(
                                color: CustomColors.subTitle,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                            children: [
                              TextSpan(
                                text:
                                    '+${globalData.newRecovered.toString().replaceAllMapped(regex, mathFunc)}',
                                style: TextStyle(
                                  color: CustomColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
