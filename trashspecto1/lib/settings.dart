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
                value: this.region,
                onChanged: (String newValue) {
                  setState(() {
                    this.region = newValue;
                  });
                  widget.updateRegion(newValue);
                },
                items: <String>['North America', 'South America', 'Asia', 'Europe', 'Africa'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
              Switch(
                value: this.metric,
                onChanged: (value) {
                  setState(() {
                    this.metric = value;
                  });
                  widget.updateMetric(value);
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ), 
            ],
          ),
        ],
      )
      
    );
  }
}