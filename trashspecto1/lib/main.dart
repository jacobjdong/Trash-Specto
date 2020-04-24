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

class ScreenTrash extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff9ee493)),
          onPressed: () {
            Navigator.pop(ctxt);
          }
        ),
        title: new Center(child: new Text ("Screen Trash", textAlign: TextAlign.center)),
      ),
      body: new Text("Here is where the total trash form will be"),
    );
  }
}

class ScreenWastewater extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff9ee493)),
          onPressed: () {
            Navigator.pop(ctxt);
          }
        ),
        title: new Center(child: new Text ("Screen Wastewater", textAlign: TextAlign.center)),
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff9ee493)),
          onPressed: () {
            Navigator.pop(ctxt);
          }
        ),
        title: new Center(child: new Text ("Screen Food Waste", textAlign: TextAlign.center)),
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff9ee493)),
          onPressed: () {
            Navigator.pop(ctxt);
          }
        ),
        title: new Center(child: new Text ("Screen AR Viewer", textAlign: TextAlign.center)),
      ),
      body: new Text("Heres wehre the AR view would be"),
    );
  }
}