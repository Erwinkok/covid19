import 'package:covid19/constants/custom_colors.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBarItem extends StatefulWidget {
  final IconData icon;
  final String text;

  const BottomNavBarItem({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  _BottomNavBarItemState createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          widget.icon,
          size: 32,
          color: CustomColors.link,
        ),
        Text(
          widget.text,
          style: TextStyle(
            color: CustomColors.link,
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
