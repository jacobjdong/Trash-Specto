import 'package:flutter/material.dart';
import 'settings.dart';
import 'food.dart';
import 'trash.dart';
import 'water.dart';

class ScreenFoodWaste extends StatefulWidget {
  @override
  _ScreenFoodWasteState createState() => _ScreenFoodWasteState();
}

class _ScreenFoodWasteState extends State<ScreenFoodWaste> {
  double _eatingOut = 4, _diet = 3, _compostingFreq = 0;

  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff778BF3)),
          onPressed: () {
            Navigator.pop(ctxt);
          }
        ),
        title: new Text ("Screen Food Waste", textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'How often do you eat out? (per week)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                '0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff778BF3),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SliderTheme(
                   data: SliderTheme.of(ctxt).copyWith(
                    activeTrackColor: Color(0xff778BF3),
                    inactiveTrackColor: Color(0xffd5e1fd),
                    trackShape: RectangularSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbColor: Color(0xff778BF3),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  ),
                  child: Slider(
                    value: _eatingOut,
                    onChanged: (value) {
                      setState(() {
                        _eatingOut = value;
                      });
                    },
                    min: 0,
                    max: 14,
                    ),
                  ),
                ],
              ),
              Text(
                '14',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff778BF3),
                ),
              ),
              ],
            ),
            Text(
                '\n\nWhat type of dietary restrictions do you conform to?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                'Vegan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff778BF3),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SliderTheme(
                   data: SliderTheme.of(ctxt).copyWith(
                    activeTrackColor: Color(0xff778BF3),
                    inactiveTrackColor: Color(0xffd5e1fd),
                    trackShape: RectangularSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbColor: Color(0xff778BF3),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  ),
                  child: Slider(
                    divisions: 5,
                    value: _diet,
                    onChanged: (value) {
                      setState(() {
                        _diet = value;
                      });
                    },
                    min: 0,
                    max: 5,
                    ),
                  ),
                ],
              ),
              Text(
                'No Restrictions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff778BF3),
                ),
              ),
              ],
            ),
            Text(
                '\n\nHow often do you compost your food waste? (days per week)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                '0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff778BF3),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SliderTheme(
                   data: SliderTheme.of(ctxt).copyWith(
                    activeTrackColor: Color(0xff778BF3),
                    inactiveTrackColor: Color(0xffd5e1fd),
                    trackShape: RectangularSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbColor: Color(0xff778BF3),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  ),
                  child: Slider(
                    divisions: 7,
                    value: _compostingFreq,
                    onChanged: (value) {
                      setState(() {
                        _compostingFreq = value;
                      });
                    },
                    min: 0,
                    max: 7,
                    ),
                  ),
                ],
              ),
              Text(
                '7',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff778BF3),
                ),
              ),
              ],
            ),
          ],
        ),
      )
    );
  }
}