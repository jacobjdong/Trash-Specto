import 'package:flutter/material.dart';
import 'package:trashspecto1/customSlider.dart';

class ScreenFoodWaste extends StatefulWidget {
  @override
  _ScreenFoodWasteState createState() => _ScreenFoodWasteState();
}

class _ScreenFoodWasteState extends State<ScreenFoodWaste> {
  double _eatingOut = 4,  _compostingFreq = 0;
  String _diet;
  List<Widget> cards;

  void removeTop() {
    setState(() {
      cards.removeAt(cards.length - 1);
    });
  }

  void updateDiet(newValue) {
    setState(() {
      this._diet = newValue;
    });
    print(newValue);
    print(this._diet);
  }

  @override
  void initState() {
    super.initState();
    cards = getCards();
  }
   
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
        title: new Text ("Screen Food Waste", textAlign: TextAlign.center),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: cards,
            ),
      )
    );
  }

  List<Widget> getCards() {
    List<Widget> cards = new List();

    cards.insert(0,
      Positioned(
        top: 60,
        child: Card(
          elevation: 10,
          color: Color.fromARGB(255, 240, 230, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            width: 260.0,
            height: 350.0,
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
                  value: this._diet,
                  items: <String>['Vegan', 'Vegetarian', 'Pescatarian', 'None'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    updateDiet(newValue);
                  },
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
            alignment: Alignment.center,
            width: 260.0,
            height: 350.0,
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
                  question: "How often do you Eat out?",
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
    );

    cards.insert(0,
      Positioned(
        top: 20,
        child: Card(
          elevation: 10,
          color: Color.fromARGB(255, 240, 230, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            width: 260.0,
            height: 350.0,
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
                  question: "How often do you compost your food waste? (days per week)'",
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
    );

    return cards;
  }
}