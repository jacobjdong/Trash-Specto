import 'package:flutter/material.dart';
import 'package:trashspecto1/customSlider.dart';
import 'arcore.dart';

class ScreenFoodWaste extends StatefulWidget {
  @override
  _ScreenFoodWasteState createState() => _ScreenFoodWasteState();
}

class _ScreenFoodWasteState extends State<ScreenFoodWaste> {
  double _eatingOut = 4,  _compostingFreq = 0;
  String _diet;
  String newValue;
  String errorString = '';
  List<Widget> cards;
  int visible = 3;

  dynamic _background = "images/foodlayout1noanything.png";
  
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
          title: new Text ("Food Waste Calculator", textAlign: TextAlign.center),
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
    this.cards = new List();

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
                width: 260.0,
                height: 350.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Do you have any dietary restrictions?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      DropdownButton<String>(
                        hint: Text('Diet'),
                        onChanged: (String changedValue) {
                          setState(() {
                            if (changedValue == 'Vegan' || changedValue == 'Vegetarian') {
                              _background = "images/foodlayout1noanything.png";
                            }
                            else if (changedValue == 'No Beef') {
                              _background = "images/foodlayout1nobeef.png";
                            }
                            else if (changedValue == 'No Pork') {
                              _background = "images/foodlayout1nopork.png";
                            }
                            else if (changedValue == 'No Beef or Pork') {
                              _background = "images/foodlayout1nobeeforpork.png";
                            }
                            else {
                              _background = "images/foodlayout1norestrictions.png";
                            }
                            _diet = changedValue;
                          });
                        },
                        value: _diet,
                        items: <String>['Vegan', 'Vegetarian', 'No Beef', 'No Pork', 'No Beef or Pork', 'No Restrictions'].map((String value) {
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
                              if (_diet == null) {
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
                )
              ),
            ]
          ),
        ),
      ),
    );

    this.cards.insert(0,
      Positioned(
        top: 70,
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
                width: 260.0,
                height: 350.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      customSlider(
                        updateVal: (value) {
                          setState(() {
                            this._eatingOut = value;
                          });
                        },
                        question: "How often do you eat out?",
                        min: 1,
                        max: 14,
                        showerTime: this._eatingOut,
                        units: "times a week",
                        unit: "time a week"
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
                              setState (() {
                                visible--;
                              });
                            }
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );

    this.cards.insert(0,
      Positioned(
        top: 40,
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
                width: 260.0,
                height: 350.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      customSlider(
                        updateVal: (value) {
                          setState(() {
                            this._eatingOut = value;
                          });
                        },
                        question: "What percentage of your food do you compost?",
                        min: 0,
                        max: 100,
                        showerTime: this._compostingFreq,
                        units: "%",
                        unit: "%",
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
                              setState (() {
                                visible--;
                              });
                              Navigator.push(
                                ctxt,
                                MaterialPageRoute(
                                  builder: (ctxt) => AutoDetectPlane(
                                    state: "food",
                                    data: calculateFood()
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
              
            ]
          )
        ),
      ),
    );

    for (int i = cards.length; i > visible; i--) {
      cards.removeAt(i-1);
    }
  }

  double calculateFood() {
    double result = .22 * _eatingOut * .25 + 7;
    if (_diet == 'Vegan') {
      result *= .6;
    } else if (_diet == 'Vegetarian') {
      result *= .68;
    } else if (_diet == 'No Restrictions') {
    } else {
      result *= .68;
    }

    result *= (1 - _compostingFreq * .01);
    return result;
  }
}