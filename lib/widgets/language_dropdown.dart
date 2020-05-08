import 'package:covid19/constants/custom_colors.dart';
import 'package:covid19/models/country_model.dart';
import 'package:flutter/material.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({
    Key key,
  }) : super(key: key);

  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String _selectedCountry;
  List<String> _countryNames = new List();

  @override
  void initState() {
    super.initState();

    countries.forEach((country) => _countryNames.add(country.country));
    _countryNames.sort((a, b) => a.compareTo(b));
    _selectedCountry = _countryNames.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
          color: CustomColors.background,
          border: Border.all(
            color: CustomColors.link.withOpacity(.5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF505050).withOpacity(.6),
              offset: Offset(0, 2),
              blurRadius: 10,
              spreadRadius: -5,
            ),
          ]),
      child: DropdownButton<String>(
        value: _selectedCountry,
        icon: Icon(
          Icons.keyboard_arrow_down,
          size: 20,
          color: CustomColors.link,
        ),
        elevation: 16,
        underline: SizedBox(height: 0),
        isDense: true,
        isExpanded: true,
        selectedItemBuilder: (BuildContext context) {
          return _countryNames.map((String country) {
            return Text(
              _selectedCountry,
              style: TextStyle(
                color: CustomColors.title,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            );
          }).toList();
        },
        items: _countryNames.asMap().entries.map((entry) {
          int index = entry.key;
          String value = entry.value;

          return DropdownMenuItem(
            value: value,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 15),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: index == _countryNames.length - 1
                      ? BorderSide.none
                      : BorderSide(
                          color: Colors.black12,
                          width: 1,
                        ),
                ),
              ),
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: (String value) {
          setState(() {
            _selectedCountry = value;
          });
        },
      ),
    );
  }
}
