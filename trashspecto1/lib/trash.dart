import 'package:flutter/material.dart';
import 'package:trashspecto1/customSlider.dart';

class ScreenTrash extends StatefulWidget {
  @override
  _ScreenTrashState createState() => _ScreenTrashState();
}

class _ScreenTrashState extends State<ScreenTrash> {
  double _value = 2;

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
        title: new Text ("Screen Trash", textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(child: 
                customSlider(
                  updateVal: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  question: "OI MATE PISS OFF",
                  min: 0,
                  max: 2,
                  showerTime: 1.0,
                  discreet: false,
                )
              ),
                
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
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        print(value);
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
            ]
          ),
        ),
      )
    );
  }
}
