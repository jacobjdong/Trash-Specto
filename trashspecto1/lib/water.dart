import 'package:flutter/material.dart';
import 'package:trashspecto1/customSlider.dart';
import 'arcore.dart';

class ScreenWastewater extends StatefulWidget {
  @override
  _ScreenWastewaterState createState() => _ScreenWastewaterState();
}

class _ScreenWastewaterState extends State<ScreenWastewater> {
  double _showerTime = 10, _showerFreq = 7, _clothesFreq = 4, _lawnSize = 50, _toiletFreq = 3;
  String _dishwasherType;
  String newValue;
  String errorString = '';

  List<Widget> cards;
  int visible = 6;
  

  dynamic _background = "images/bathroomlayout.png";
  
  @override
  Widget build (BuildContext ctxt) {
    updateCards(ctxt);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(_background),
          fit: BoxFit.cover
        ),
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff89e5ff)),
            onPressed: () {
              Navigator.pop(ctxt);
            }
          ),
          title: new Text ("Wastewater Calculator", textAlign: TextAlign.center),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: cards,
              ),
        )
      ),
    );
  }

  void updateCards(BuildContext ctxt) {
    cards = new List();

    cards.insert(0,
      Positioned(
        top: 190,
        child: Card(
          elevation: 10,
          color: Color.fromARGB(255, 240, 230, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            width: 260.0,
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  customSlider(
                    updateVal: (value) {
                      setState(() {
                        this._toiletFreq = value;
                      });
                    },
                    question: "How often do you flush the toilet?",
                    min: 0,
                    max: 10,
                    showerTime: this._toiletFreq,
                    units: "times a day",
                    unit: "time a day",
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 20)
                        ),
                        onPressed: () {
                          setState(() {
                            visible--;
                          });
                        }
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    cards.insert(0,
      Positioned(
        top: 160,
        child: Card(
          elevation: 10,
          color: Color.fromARGB(255, 240, 230, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            width: 260.0,
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  customSlider(
                    updateVal: (value) {
                      setState(() {
                        this._showerFreq = value;
                      });
                    },
                    question: "How often do you shower?",
                    min: 0,
                    max: 14,
                    showerTime: this._showerFreq,
                    units: "times a week",
                    unit: "time a week",
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 20)
                        ),
                        onPressed: () {
                          setState(() {
                            visible--;
                          });
                        }
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
    cards.insert(0,
      Positioned(
        top: 130,
        child: Card(
          elevation: 10,
          color: Color.fromARGB(255, 240, 230, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            alignment: Alignment.center,
            width: 260.0,
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  customSlider(
                    updateVal: (value) {
                      setState(() {
                        this._showerTime = value;
                      });
                    },
                    question: "How long is your average shower?",
                    min: 5,
                    max: 30,
                    showerTime: this._showerTime,
                    units: "minutes",
                    unit: "minute",
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 20)
                        ),
                        onPressed: () {
                          setState(() {
                            visible--;
                          });
                          _background = "images/laundrylayout.png";
                        }
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    cards.insert(0,
      Positioned(
        top: 100,
        child: Card(
          elevation: 10,
          color: Color.fromARGB(255, 240, 230, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            width: 260.0,
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
          alignment: Alignment.topRight,
          child: FloatingActionButton(
            heroTag: "helpBut",
            onPressed: () {

            },
            child: Icon(Icons.help_outline, color:Color(0xff5361c2)),
            mini: true,
            backgroundColor: Color(0xffffffff),
          ),
        ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    'How do you wash your dishes?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  DropdownButton<String>(
                    hint: Text('Hand or Machine'),
                    onChanged: (String changedValue) {
                      setState(() {
                        _dishwasherType = changedValue;
                      });
                    },
                    value: _dishwasherType,
                    items: <String>['Hand', 'Machine'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                  Text(
                    errorString,
                    style: TextStyle(
                      color: Colors.red,
                    )
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 20)
                        ),
                        onPressed: () {
                          if (_dishwasherType == null) {
                            setState(() {
                              errorString = "Please select a value";
                            });
                          } else {
                            setState(() {
                              visible--;
                            });
                          }
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    cards.insert(0,
      Positioned(
        top: 70,
        child: Card(
          elevation: 10,
          color: Color.fromARGB(255, 240, 230, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            alignment: Alignment.center,
            width: 260.0,
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  customSlider(
                    updateVal: (value) {
                      setState(() {
                        this._clothesFreq = value;
                      });
                    },
                    question: "How often do you wash your clothes?",
                    min: 0,
                    max: 8,
                    showerTime: this._clothesFreq,
                    units: "times a month",
                    unit: "time a month"
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 20)
                        ),
                        onPressed: () {
                          setState(() {
                            visible--;
                          });
                          _background = "images/lawnlayout.png";
                        }
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    cards.insert(0,
      Positioned(
        top: 40,
        child: Card(
          elevation: 10,
          color: Color.fromARGB(255, 240, 230, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            width: 260.0,
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  customSlider(
                    updateVal: (value) {
                      setState(() {
                        this._lawnSize = value;
                      });
                      
                    },
                    question: "How large is your grass lawn?",
                    min: 0,
                    max: 100,
                    showerTime: this._lawnSize,
                    units: "meters\u00B2",
                    unit: "meter\u00B2",
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        child: Text(
                          'Submit!',
                          style: TextStyle(fontSize: 20)
                        ),
                        onPressed: () {
                          setState(() {
                            visible--;
                          });
                          Navigator.push(
                            ctxt,
                            MaterialPageRoute(
                              builder: (ctxt) => AutoDetectPlane(
                                state: "water", 
                                data: calculateWater()
                              ),
                            )
                          );
                        }
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

    for (int i = cards.length; i > visible; i--) {
      cards.removeAt(i-1);
    }
  }

  double calculateWater() {
    double result = (_showerTime * 7.9 * _showerFreq) + (13.6 * _toiletFreq) + (3.5 * _lawnSize) + (155 * _clothesFreq / 4);
    result += _dishwasherType == "Hand" ? 88 : 400;
    return result;
  }
}