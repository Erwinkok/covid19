
import 'package:covid19/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class SelfCheckup extends StatelessWidget {
  const SelfCheckup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.green,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.favorite_border,
            size: 30,
            color: CustomColors.title,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Self Check up Covid-19',
                style: TextStyle(
                  color: CustomColors.title,
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Center(
            child: Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: CustomColors.title,
            ),
          ),
        ],
      ),
    );
  }
}
