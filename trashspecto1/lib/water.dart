import 'package:flutter/material.dart';
import 'package:trashspecto1/customSlider.dart';

class ScreenWastewater extends StatefulWidget {
  @override
  _ScreenWastewaterState createState() => _ScreenWastewaterState();
}

class _ScreenWastewaterState extends State<ScreenWastewater> {
  double _showerTime = 10, _showerFreq = 7, _clothesFreq = 4, _lawnSize = 50, _toiletFreq = 3;
  String _dishwasherType;
  String newValue;
  List<Widget> cards;
  int visible = 6;

  dynamic _background = "images/bathroomlayout.png";
  
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
          title: new Text ("Screen Wastewater", textAlign: TextAlign.center),
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
                    question: "How often do you flush the toilet (per day)",
                    min: 0,
                    max: 10,
                    showerTime: this._toiletFreq,
                    discreet: false,
                  ),
                  RaisedButton(
                    child: Text(
                      'Remove!',
                      style: TextStyle(fontSize: 20)
                    ),
                    onPressed: () {
                      setState(() {
                        visible--;
                      });
                    }
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
                    question: "How often do you shower (per week)",
                    min: 0,
                    max: 14,
                    showerTime: this._showerFreq,
                    discreet: false,
                  ),
                  RaisedButton(
                    child: Text(
                      'Remove!',
                      style: TextStyle(fontSize: 20)
                    ),
                    onPressed: () {
                      setState(() {
                        visible--;
                      });
                    }
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
                    question: "How long is your average shower (minutes)",
                    min: 5,
                    max: 30,
                    showerTime: this._showerTime,
                    discreet: false,
                  ),
                  RaisedButton(
                    child: Text(
                      'Remove!',
                      style: TextStyle(fontSize: 20)
                    ),
                    onPressed: () {
                      setState(() {
                        visible--;
                      });
                    }
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
                      newValue = changedValue;
                      _dishwasherType = changedValue;
                      setState(() {
                        newValue;
                        print(newValue);
                      });
                    },
                    value: newValue,
                    items: <String>['Hand', 'Machine'].map((String value) {
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
                      setState(() {
                        visible--;
                      });
                    }
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
                    question: "How often do you wash your clothes (per month)",
                    min: 0,
                    max: 8,
                    showerTime: this._clothesFreq,
                    discreet: false,
                  ),
                  RaisedButton(
                    child: Text(
                      'Remove!',
                      style: TextStyle(fontSize: 20)
                    ),
                    onPressed: () {
                      setState(() {
                        visible--;
                      });
                    }
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
                    question: "How large is your grass lawn (meters squared)",
                    min: 0,
                    max: 100,
                    showerTime: this._lawnSize,
                    discreet: false,
                  ),
                  RaisedButton(
                    child: Text(
                      'Remove!',
                      style: TextStyle(fontSize: 20)
                    ),
                    onPressed: () {
                      setState(() {
                        visible--;
                      });
                    }
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