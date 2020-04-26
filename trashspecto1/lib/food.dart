import 'package:flutter/material.dart';
import 'package:trashspecto1/customSlider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:nice_button/nice_button.dart';
import 'arcore.dart';

class ScreenFoodWaste extends StatefulWidget {
  final bool metric;

  ScreenFoodWaste({this.metric});

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
          title: new Text ("Food Waste Calculator", textAlign: TextAlign.center,
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

  void updateCards(BuildContext ctxt) async {
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
                              title: "Food tip #1", 
                              desc: "Beef—which is the second most popular meat in the U.S.—has the largest water footprint out of all types of meat, taking a whopping 1,800 gallons of water per pound.",
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
                          child: NiceButton(
                            width: 255,
                            elevation: 8.0,
                            radius: 52.0,
                            text: 'Next',
                            background: Color(0xff5361c2),
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
                            this._eatingOut = value;
                          });
                        },
                        question: "How often do you eat out?",
                        min: 1,
                        max: 14,
                        showerTime: this._eatingOut,
                        metric: false,
                        units: "times a week",
                        unit: "time a week",
                        title: "Food tip #2",
                        desc: "Planning out your meals and making a shopping list can reduce the amount of extra food bought, and lead to a more fulfilling cooking session."
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
                            this._eatingOut = value;
                          });
                        },
                        question: "What percentage of your food do you compost?",
                        min: 0,
                        max: 100,
                        showerTime: this._compostingFreq,
                        metric: false,
                        units: "%",
                        unit: "%",
                        title: "Food tip #3",
                        desc: "Prepare or cook perishables, and then freeze them for later consumption. Leftovers for days!"
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
                      ),
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
    } 
      else if (_diet == 'No Beef' || _diet == 'No Pork' || _diet == 'No Beef or Pork'){
      result *= .76;
    } else if (_diet == 'No Restrictions') {
    } else {
      result *= .68;
    }

    result *= (1 - (_compostingFreq * .01));
    result /= 7;
    return result;
  }
}