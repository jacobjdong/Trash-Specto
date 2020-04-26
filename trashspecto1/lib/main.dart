import 'package:flutter/material.dart';
import 'settings.dart';
import 'food.dart';
import 'trash.dart';
import 'water.dart';

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
  String chosenRegion = "North America";
  bool metric = true;

  @override
  Widget build(BuildContext ctxt) {
  
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image:AssetImage("images/homepage.png"),
          fit: BoxFit.cover
        ),
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          title: new Center(child: new Text ("Home Page", textAlign: TextAlign.center)),
        ),
        body: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
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
                'Settings',
                style: TextStyle(fontSize: 20)
              ),
              onPressed: () {
                Navigator.push(
                  ctxt,
                  MaterialPageRoute(builder: (ctxt) => new Settings(
                    region: this.chosenRegion,
                    metric: this.metric,
                    updateRegion: (newRegion) {
                      setState(() {
                        this.chosenRegion = newRegion;
                      });
                    },
                    updateMetric: (value) {
                      setState(() {
                        this.metric = value;
                      });
                    },
                  )),
                );
              }
            ),
              ]
            ),
          ]
        )
      ),
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
      body: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[
          new Column(
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
          ],),
        ]
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