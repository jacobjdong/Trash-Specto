import 'package:flutter/material.dart';

class Settings extends StatefulWidget { 
  final String region;
  final bool metric;
  Function updateRegion;
  Function updateMetric;
  Settings({this.region, this.metric, this.updateRegion, this.updateMetric});

  @override
  State<StatefulWidget> createState() {
    return _SettingsState(
      region: this.region,
      metric: this.metric
    );
  }
}

class _SettingsState extends State<Settings> {
  String region;
  bool metric;

  _SettingsState({this.region, this.metric});

  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff89e5ff)),
          onPressed: () {
            Navigator.pop(ctxt);
          }
        ),
        title: new Text ("Settings", textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 23.9,
            fontWeight: FontWeight.bold)),
      ),
      body: new ListView(
       children: [
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new SizedBox(height: 50),
                Text(
                  'Geographic Region',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                new DropdownButton<String>(
                  value: this.region,
                  onChanged: (String newValue) {
                    setState(() {
                      this.region = newValue;
                    });
                    widget.updateRegion(newValue);
                  },
                  items: <String>['Asia', 'Africa', 'Europe', 'North America', 'South America', 'Oceania'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Metric Units',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Switch(
                  value: this.metric,
                  onChanged: (value) {
                    setState(() {
                      this.metric = value;
                    });
                    widget.updateMetric(value);
                  },
                  activeTrackColor: Color(0xff89e5ff),
                  activeColor: Color(0xff72c9e9),
                  autofocus: false,
                ), 
                
              ],
            ),
            ]
          ),
        ],
      )
    );
  }
}

// RaisedButton(
//   onPressed: () {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: Stack(
//               overflow: Overflow.visible,
//               children: <Widget>[
//                 Positioned(
//                   right: -40.0,
//                   top: -40.0,
//                   child: InkResponse(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: CircleAvatar(
//                       child: Icon(Icons.close),
//                       backgroundColor: Colors.red,
//                     ),
//                   ),
//                 ),
                
//               ],
//             ),
//           );
//         }
//     );
//   },
//   child: Text("Open Popup"),
// ),