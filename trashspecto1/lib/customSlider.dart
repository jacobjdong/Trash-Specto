import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class customSlider extends StatefulWidget {
  final Function updateVal;
  final String question;
  final String units;
  final String unit;
  final String title;
  final String desc;
  final double showerTime;
  final int min;
  final int max;
  final bool metric;

  customSlider({this.updateVal, this.question, this.showerTime, this.units, this.unit, this.min, this.max, this.metric, this.title, this.desc});

  @override
  State<StatefulWidget> createState() {
    return _customSliderState(
      min: this.min,
      max: this.max,
      showerTime: this.showerTime
    );
  }
}

class _customSliderState extends State<customSlider> {
  int min;
  int max;
  double showerTime;

  _customSliderState({this.min, this.max, this.showerTime});


  @override 
  Widget build (BuildContext context) {
    return new Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: FloatingActionButton(
            heroTag: "helpBut" + this.widget.question,
            onPressed: () {
              return Alert(context: context, 
                title: widget.title, 
                desc: widget.desc,
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
          height:60
        ),
        Text(
            widget.question,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.min.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff778BF3),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Color(0xff778BF3),
                  inactiveTrackColor: Color(0xffd5e1fd),
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbColor: Color(0xff778BF3),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                ),
                child: Slider(
                    value: showerTime,
                    onChanged: (value) { 
                      setState(() {
                        showerTime = value;
                      });
                      if (widget.metric) {
                        widget.updateVal(value);
                      } else {
                        widget.updateVal(value * 4046.86);
                      }
                        
                    },
                    min: this.min.toDouble(),
                    max: this.max.toDouble(),
                  )
                )
              ],
            ),
            Text(
              ('10000' == this.max.toString() ? '10k' : this.max.toString()) + (widget.units != '%'  ? "+" : ""),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff778BF3),
              ),
            ),
          ],
        ),
        Text(
          this.showerTime.toInt().toString() + (this.showerTime.toInt() == this.max.toInt() && (widget.units != '%') ? "+" : "") + ' ' + (this.showerTime.toInt() == 1 ? widget.unit : widget.units),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xff778BF3),
          ),
        ),
      ] 
    );
  }
}