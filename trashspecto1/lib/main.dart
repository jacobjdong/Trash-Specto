import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xfff7d0e5),
        accentColor: Color(0xff9ee493),
        
        fontFamily: 'Georgia'
      ),
      home: new MainScreen(),
    );
  }
}



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
  
}

class _MainScreenState extends State<MainScreen> {
  String name;
  String ccode;

  @override
  Widget build(BuildContext ctxt) {
  
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text ("Home Page", textAlign: TextAlign.center)),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[
          RaisedButton(
            child: Text(
              'Start!',
              style: TextStyle(fontSize: 20)
            ),
            onPressed: () {
              Navigator.push(
                ctxt,
                MaterialPageRoute(builder: (ctxt) => ScreenOne()),
              );
            }
          ),
          RaisedButton(
            child: Text(
              'Overall Garbage',
              style: TextStyle(fontSize: 20)
            ),
            onPressed: () {
              Navigator.push(
                ctxt,
                MaterialPageRoute(builder: (ctxt) => Settings()),
              );
            }
          ),
        ]
      )
    );
  }
}

class Settings extends StatefulWidget {
  
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String chosenRegion = "North America";

  @override
  Widget build (BuildContext ctxt) {

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff9ee493)),
          onPressed: () {
            Navigator.pop(ctxt);
          }
        ),
        title: new Text ("Settings", textAlign: TextAlign.center),
      ),
      body: new ListView(
       children: [
          new Column(
            children: <Widget>[
              new DropdownButton<String>(
                value: chosenRegion,
                onChanged: (String newValue) {
                  setState(() {
                    chosenRegion = newValue;
                  });
                },
                items: <String>['North America', 'South America', 'Asia', 'Europe', 'Africa'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      )
      
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text ("Home Page", textAlign: TextAlign.center)),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[
          RaisedButton(
            child: Text(
              'Overall Garbage',
              style: TextStyle(fontSize: 20)
            ),
            onPressed: () {
              Navigator.push(
                ctxt,
                MaterialPageRoute(builder: (ctxt) => Settings()),
              );
            }
          ),
          RaisedButton(
            child: Text(
              'Wastewater',
              style: TextStyle(fontSize: 20)
            ),
            onPressed: () {
              Navigator.push(
                ctxt,
                MaterialPageRoute(builder: (ctxt) => ScreenWastewater()),
              );
            }
          ),
          RaisedButton(
            child: Text(
              'Food Waste',
              style: TextStyle(fontSize: 20)
            ),
            onPressed: () {
              Navigator.push(
                ctxt,
                MaterialPageRoute(builder: (ctxt) => ScreenFoodWaste()),
              );
            }
          ),
          RaisedButton(
            child: Text(
              'AR Viewer',
              style: TextStyle(fontSize: 20)
            ),
            onPressed: () {
              Navigator.push(
                ctxt,
                MaterialPageRoute(builder: (ctxt) => ScreenARViewer()),
              );
            }
          ),
        ]
      )
    );
  }
}

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

class ScreenFoodWaste extends StatefulWidget {
  @override
  _ScreenFoodWasteState createState() => _ScreenFoodWasteState();
}

class _ScreenFoodWasteState extends State<ScreenFoodWaste> {
  double _eatingOut = 4, _diet = 7, _compostingFreq = 0;

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

class ScreenARViewer extends StatelessWidget {
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
        title:  new Text ("Screen AR Viewer", textAlign: TextAlign.center),
      ),
      body: new Text("Heres wehre the AR view would be"),
    );
  }
}