import 'package:flutter/material.dart';
import 'package:trashspecto1/customSlider.dart';

class ScreenFoodWaste extends StatefulWidget {
  @override
  _ScreenFoodWasteState createState() => _ScreenFoodWasteState();
}

class _ScreenFoodWasteState extends State<ScreenFoodWaste> {
  double _eatingOut = 4,  _compostingFreq = 0;
  String _diet;
  String newValue;
  List<Widget> cards;

  void removeTop() {
    setState(() {
      cards.removeAt(cards.length - 1);
    });
  }

  dynamic _background = "images/foodlayout1nobeef.png";
  
  @override
  Widget build (BuildContext ctxt) {
    updateCards();
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
            icon: Icon(Icons.arrow_back, color: Color(0xff778BF3)),
            onPressed: () {
              Navigator.pop(ctxt);
            }
          ),
          title: new Text ("Screen Food Waste", textAlign: TextAlign.center),
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

  List<Widget> updateCards() {
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
          child: Container(
            width: 260.0,
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'What type of dietary restrictions do you conform to?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  DropdownButton<String>(
                    hint: Text('Diet'),
                    onChanged: (String changedValue) {
                      newValue = changedValue;
                      _diet = changedValue;
                      setState(() {
                        if (_diet == 'Vegan' || _diet == 'Vegetarian') {
                          _background = "images/foodlayout1noanything.png";
                        }
                        else if (_diet == 'No Beef') {
                          _background = "images/foodlayout1nobeef.png";
                        }
                        else if (_diet == 'No Pork') {
                          _background = "images/foodlayout1nopork.png";
                        }
                        else if (_diet == 'No Beef or Pork') {
                          _background = "images/foodlayout1nobeeforpork.png";
                        }
                        else {
                          _background = "images/foodlayout1norestrictions.png";
                        }
                        newValue;
                        print(newValue);
                      });
                    },
                    value: newValue,
                    items: <String>['Vegan', 'Vegetarian', 'No Beef', 'No Pork', 'No Beef or Pork', 'No Restrictions'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                  RaisedButton(
                    child: Text(
                      'Remove!',
                      style: TextStyle(fontSize: 20)
                    ),
                    onPressed: () {
                      removeTop();
                    }
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
                        this._eatingOut = value;
                      });
                    },
                    question: "How often do you eat out?",
                    min: 1,
                    max: 14,
                    showerTime: this._eatingOut,
                  ),
                  RaisedButton(
                    child: Text(
                      'Remove!',
                      style: TextStyle(fontSize: 20)
                    ),
                    onPressed: () {
                      removeTop();
                    }
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
                        this._eatingOut = value;
                      });
                    },
                    question: "How often do you compost your food waste? (days per week)",
                    min: 0,
                    max: 7,
                    showerTime: this._compostingFreq,
                  ),
                  RaisedButton(
                    child: Text(
                      'Remove!',
                      style: TextStyle(fontSize: 20)
                    ),
                    onPressed: () {
                      removeTop();
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}