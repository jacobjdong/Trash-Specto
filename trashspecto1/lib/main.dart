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
      home: new ScreenOne(),
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
                MaterialPageRoute(builder: (ctxt) => ScreenTrash()),
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
          icon: Icon(Icons.arrow_back, color: Color(0xff9ee493)),
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

class ScreenWastewater extends StatelessWidget {
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
        title: new Text ("Screen Wastewater", textAlign: TextAlign.center),
      ),
      body: new Text("Here is where the wastewater form will be"),
    );
  }
}

class ScreenFoodWaste extends StatelessWidget {
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
        title: new Text ("Screen Food Waste", textAlign: TextAlign.center),
      ),
      body: new Text("Here is where the food waste form will be"),
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
          icon: Icon(Icons.arrow_back, color: Color(0xff9ee493)),
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