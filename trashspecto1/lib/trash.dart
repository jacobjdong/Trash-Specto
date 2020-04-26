import 'package:flutter/material.dart';
import 'package:trashspecto1/customSlider.dart';

class ScreenTrash extends StatefulWidget {
  @override
  _ScreenTrashState createState() => _ScreenTrashState();
}

class _ScreenTrashState extends State<ScreenTrash> {
  double _recyclePercent = 10, _clothing = 1, _compostPercent = 10;
  String _shoppingType;
  String newValue;
  List<Widget> cards;
  int visible = 4;

  dynamic _background = "images/citylayout.png";
  
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
          title: new Text ("Screen Garbage", textAlign: TextAlign.center),
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
                    units: "%"
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
                      newValue = changedValue;
                      _shoppingType = changedValue;
                      setState(() {
                        newValue;
                        print(newValue);
                      });
                    },
                    value: newValue,
                    items: <String>['Frugal', 'Average', 'Shopaholic'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
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
                    units: "%"
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
}