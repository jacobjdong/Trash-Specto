import 'package:flutter/material.dart';

class customSlider extends StatefulWidget {
  final Function updateVal;
  final String question;
  final String units;
  final double showerTime;
  final int min;
  final int max;

  customSlider({this.updateVal, this.question, this.showerTime, this.units, this.min, this.max});

  @override
  State<StatefulWidget> createState() {
    return _customSliderState(
      min: this.min,
      max: this.max,
      showerTime: this.showerTime
    );
  }
}

class _customSliderState extends State<customSlider> {
  int min;
  int max;
  double showerTime;

  _customSliderState({this.min, this.max, this.showerTime});

  @override 
  Widget build (BuildContext ctxt) {
    return new Column(
      children: <Widget>[
        Text(
            widget.question,
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
              this.min.toString(),
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
                  value: showerTime,
                  onChanged: (value) { 
                    setState(() {
                      showerTime = value;
                    });
                    widget.updateVal(value);
                  },
                  min: this.min.toDouble(),
                  max: this.max.toDouble(),
                  ),
                ),
              ],
            ),
            Text(
              this.max.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff778BF3),
              ),
            ),
          ],
        ),
      ] 
    );
  }
}