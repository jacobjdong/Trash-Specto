import 'package:flutter/material.dart';
import 'package:trashspecto1/customSlider.dart';
import 'arcore.dart';

class ScreenTrash extends StatefulWidget {
  @override
  _ScreenTrashState createState() => _ScreenTrashState();
}

class _ScreenTrashState extends State<ScreenTrash> {
  double _recyclePercent = 10, _clothing = 1, _compostPercent = 10;
  String _shoppingType;
  String newValue;
  String errorString = '';

  List<Widget> cards;
  int visible = 4;

  dynamic _background = "images/citylayout.png";
  
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
          title: new Text ("Overall Garbage Calculator", textAlign: TextAlign.center),
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
        top: 130,
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
                  SizedBox(
                    height:100,
                  ),
                   customSlider(
                    updateVal: (value) {
                      setState(() {
                        this._recyclePercent = value;
                      });
                    },
                    question: "What percentage of your waste do you recycle?",
                    min: 0,
                    max: 100,
                    showerTime: this._recyclePercent,
                    units: "%",
                    unit: "%",
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
        top: 100,
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
                  SizedBox(
                    height:100,
                  ),
                   customSlider(
                    updateVal: (value) {
                      setState(() {
                        this._compostPercent = value;
                      });
                    },
                    question: "What percentage of your food waste do you compost?",
                    min: 0,
                    max: 100,
                    showerTime: this._compostPercent,
                    units: "%",
                    unit: "%",
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
            width: 260.0,
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height:100,
                  ),
                  Text(
                    'What type of shopper are you?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  DropdownButton<String>(
                    hint: Text('Average'),
                    onChanged: (String changedValue) {
                      setState(() {
                        _shoppingType = changedValue;
                      });
                    },
                    value: _shoppingType,
                    items: <String>['Frugal', 'Average', 'Shopaholic'].map((String value) {
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
                          if (_shoppingType == null) {
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
                  SizedBox(
                    height:100,
                  ),
                   customSlider(
                    updateVal: (value) {
                      setState(() {
                        this._clothing = value;
                      });
                    },
                    question: "What percentage of your clothing do you donate?",
                    min: 0,
                    max: 100,
                    showerTime: this._clothing,
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
                          setState(() {
                            visible--;
                          });
                          Navigator.push(
                            ctxt,
                            MaterialPageRoute(
                              builder: (ctxt) => AutoDetectPlane(
                              state: "trash", 
                              data: calculateTrash()
                            ),
                          ));
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

    for (int i = cards.length; i > visible; i--) {
      cards.removeAt(i-1);
    }
  }

  double calculateTrash() {
    double result = 4.4 - (3.52 * this._recyclePercent * 0.01);
    result -= .88 * _compostPercent * 0.01;

    if (_shoppingType == 'Average') {
      result *= 1.05;
    } else if (_shoppingType == 'Shopaholic') {
      result *= 1.1;
    }

    result *= (1 - this._clothing * 0.05);

    print(result);

    return result;
  }
}