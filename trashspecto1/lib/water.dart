import 'package:flutter/material.dart';
import 'package:trashspecto1/customSlider.dart';
import 'package:nice_button/nice_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'arcore.dart';

class ScreenWastewater extends StatefulWidget {
  final bool metric;

  ScreenWastewater({this.metric});

  @override
  _ScreenWastewaterState createState() => _ScreenWastewaterState();
}

class _ScreenWastewaterState extends State<ScreenWastewater> {
  double _showerTime = 10, _showerFreq = 7, _clothesFreq = 4, _toiletFreq = 3;
  double _lawnSize;
  String _dishwasherType;
  String newValue;
  String errorString = '';

  List<Widget> cards;
  int visible = 6;

  @override
  void initState() {
    super.initState();
    _lawnSize = (widget.metric ? 50 : 1);
}
  

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
          title: new Text ("Wastewater Calculator", textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 23.9,
            fontWeight: FontWeight.bold)),
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
            width: 270.0,
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
                    metric: false,
                    units: "times a day",
                    unit: "time a day",
                    title: "Water tip #1",
                    desc: "An average person flushes about 18 gallons a day down the toilet. Why we haven’t implemented greywater systems to do this? No one knows!"
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                          child: NiceButton(
                            width: 255,
                            elevation: 8.0,
                            radius: 52.0,
                            text: 'Next',
                            background: Color(0xff5361c2),
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
            width: 270.0,
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
                    metric: false,
                    units: "times a week",
                    unit: "time a week",
                    title: "Water tip #2",
                    desc: "Take shorter showers to significantly reduce water usage.",
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                          child: NiceButton(
                            width: 255,
                            elevation: 8.0,
                            radius: 52.0,
                            text: 'Next',
                            background: Color(0xff5361c2),
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
            width: 270.0,
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
                    metric: false,
                    units: "minutes",
                    unit: "minute",
                    title: "Water tip #3",
                    desc: "Did you know the average shower head uses more than 7.5 liters (change based on user) 2 gallons of water per minute?"
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                          child: NiceButton(
                            width: 255,
                            elevation: 8.0,
                            radius: 52.0,
                            text: 'Next',
                            background: Color(0xff5361c2),
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

    this.cards.insert(0,
      Positioned(
        top: 100,
        child: Card(
          elevation: 10,
          color: Color.fromARGB(255, 240, 230, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 270.0,
                height: 350.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: FloatingActionButton(
                          heroTag: "helpBut",
                          onPressed: () {
                            return Alert(context: context, 
                              title: "Water tip #4", 
                              desc: "Check pipes, faucets, and toilets for leaks. Leaks account for more than 1 trillion gallon of water wasted annually nationwide!",
                              buttons: [
                                DialogButton(
                                  child: Text("Exit",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 23.9,
                                    fontWeight: FontWeight.bold)),
                                  color: Color(0xff5361c2),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }
                                )
                              ]).show();
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
                          child: NiceButton(
                            width: 255,
                            elevation: 8.0,
                            radius: 52.0,
                            text: 'Next',
                            background: Color(0xff5361c2),
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
                  )
                ),
              ),
            ]
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
            width: 270.0,
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
                    metric: false,
                    units: "times a month",
                    unit: "time a month",
                    title: "Water tip #5", 
                    desc: "Washing your dishes using a dishwasher can reduce your water use by more than 50%!"
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: NiceButton(
                        width: 255,
                        elevation: 8.0,
                        radius: 52.0,
                        text: 'Next',
                        background: Color(0xff5361c2),
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
            width: 270.0,
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
                      print(value);
                      
                    },
                    question: "How large is your grass lawn?",
                    min: 0,
                    max: widget.metric ? 10000 : 5,
                    showerTime: this._lawnSize,
                    metric: widget.metric,
                    units: widget.metric ? "meters\u00B2" : "Acres",
                    unit: widget.metric ? "meter\u00B2" : "Acre",
                    title: "Water tip #6",
                    desc: "Planting a lawn that requires less watering can have a big impact in dry regions."
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                        child: NiceButton(
                          width: 255,
                          elevation: 8.0,
                          radius: 52.0,
                          text: 'Submit!',
                          background: Color(0xff5361c2),
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
                      )
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
    double result = (_showerTime * 7.9 * _showerFreq) + (13.6 * _toiletFreq * 7) + (3.5 * _lawnSize * 7) + (155 * _clothesFreq / 4);
    result += _dishwasherType == "Hand" ? 88 : 400;
    result = result/7;
    return result;
  }
}