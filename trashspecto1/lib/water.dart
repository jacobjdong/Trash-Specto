import 'package:flutter/material.dart';
import 'settings.dart';
import 'food.dart';
import 'trash.dart';
import 'water.dart';

class ScreenWastewater extends StatefulWidget {
  @override
  _ScreenWastewaterState createState() => _ScreenWastewaterState();
}

class _ScreenWastewaterState extends State<ScreenWastewater> {
  double _showerTime = 10, _showerFreq = 7, _dishwashingType = 1, _clothesFreq = 4, _lawnSize = 1000;

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
        title: new Text ("Screen Wastewater", textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'How long is your average shower? (minutes)',
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
                '5',
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
                    value: _showerTime,
                    onChanged: (value) {
                      setState(() {
                        _showerTime = value;
                      });
                    },
                    min: 5,
                    max: 30,
                    ),
                  ),
                ],
              ),
              Text(
                '30',
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
                '\n\nHow often do you shower? (per week)',
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
                    divisions: 14,
                    value: _showerFreq,
                    onChanged: (value) {
                      setState(() {
                        _showerFreq = value;
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
                '\n\nHow do you wash your dishes?',
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
                'Hand',
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
                    divisions: 1,
                    value: _dishwashingType,
                    onChanged: (value) {
                      setState(() {
                        _dishwashingType = value;
                      });
                    },
                    min: 0,
                    max: 1,
                    ),
                  ),
                ],
              ),
              Text(
                'Machine',
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
                '\n\nHow often do you wash your clothes? (per month)',
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
                    divisions: 5,
                    value: _clothesFreq,
                    onChanged: (value) {
                      setState(() {
                        _clothesFreq = value;
                      });
                    },
                    min: 0,
                    max: 5,
                    ),
                  ),
                ],
              ),
              Text(
                '5',
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
                '\n\nHow large is your grass lawn? (meters squared)',
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
                    value: _lawnSize,
                    onChanged: (value) {
                      setState(() {
                        _lawnSize = value;
                      });
                    },
                    min: 0,
                    max: 10000,
                    ),
                  ),
                ],
              ),
              Text(
                '10,000',
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