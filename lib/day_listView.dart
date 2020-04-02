import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterworktimeapp/toggle_switch.dart';
import 'package:intl/intl.dart';

import 'custom_slider_thumb_circle.dart';

class DayListView extends StatefulWidget {
  DayListView({Key key}) : super(key: key);

  @override
  _DayListViewState createState() => _DayListViewState();
}

class _DayListViewState extends State<DayListView>
{
  String _completerText;

  bool isToday(DateTime _dateTime, int index)
  {
    // TODO offset by -2 because not falling on the right day???
    var day = DateFormat('d').format(
        _dateTime.subtract(Duration(days: _dateTime.weekday - index - 2)));

    var diff =
    _dateTime.weekday.compareTo(int.parse(day)); //_dateTime.day - index);

    if (diff == 0)
    {
      return true;
    }
    return false;
  }

  Future _toggleSwitch()
  async {
    setState(()
    {
      _completerText = "";
    });
    Future.delayed(new Duration(milliseconds: 200), ()
    {
      return Random().nextBool();
    }).then(
          (value)
      {
        setState(()
        {
          _switchValue = value;
          _completerText = "Completed with $value";
          // _renderIndex++;                    !!!
        });
      },
    );
  }

  void printValue(bool value)
  {
    if(value)
      {
        print("On");
      }
    else
      {
        print("Off");
      }
  }

  var _switchValue = false;

  @override
  Widget build(BuildContext context)
  {
    // Widget _dayListView(BuildContext context)
    {
      // names of weekdays
      final dayNames = [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ];

      var _sliderValue = 0.0;

      // var _value = false;

      // var _value;

      onChange(bool value)
      {
        setState(()
        {
          // _value=value;
          /*
          if(value)
            {
              print("true");
            }
          else
            {
              print("false");
            }

           */
        });
      }

      // switch
      // https://github.com/flutter/flutter/issues/46046

      // print("updated $_value");

      Color enabledColor = Colors.green;
      Color disabledColor = Colors.grey;

      int _renderIndex = 0;
      var _completerText = "";

      return ListView.builder
        (
          itemCount: dayNames.length,
          itemBuilder: (context, index)
          {
            DateTime _dateTime = DateTime.now();

            return ListTile(
              dense: true,

              title: Text(DateFormat('EEEE, d')
                  .format(
                  _dateTime.subtract(
                      Duration(days: _dateTime.weekday - index)))),
              // title: Text(dayNames[index]),
              // trailing: Icon(Icons.more_vert),
              trailing: Icon(Icons.edit),
              leading:Visibility(
                  visible: isToday(_dateTime, index),
                  child: Switch(
                  key: Key(_renderIndex.toString()),
                  value: _switchValue,
                  onChanged: (bool value)
                  {
                    if (this.mounted)
                    {
                      if (value)
                      {
                        printValue(value);
                        _toggleSwitch();
                      }
                      else
                      {
                        printValue(value);
                        setState(()
                        {
                          _switchValue = false;
                          _completerText = "";
                        });
                      };
                    }
                  }
              ),
              ),
            );
          }
      );
    }
  }

}

    /*
      return ListView.builder(
          itemCount: dayNames.length,
          itemBuilder: (context, index) {
            DateTime _dateTime = DateTime.now();

            var _value; //  = 0.0;

            var _sliderHeight = 48.0;
            var _max = 10;
            var _min = 0;
            var _fullWidth = false;

            return ListTile(
              dense: true,
              // TODO add day time summary (ex: number of hours)
              // TODO could even show red if time not complete
              title: Text(DateFormat('EEEE, d').format(_dateTime
                  .subtract(Duration(days: _dateTime.weekday - index)))),
              // title: Text(dayNames[index]),
              // trailing: Icon(Icons.more_vert),
              // trailing: Icon(Icons.edit),
              leading: Visibility(
                visible: true, // isToday(_dateTime, index),
                child: Switch(
                    value: _value, onChanged: (bool value)=>onChange(value),
                    activeColor: Colors.blue),
              ),
                // trailing: new Slider(key: null, onChanged: sliderChanged, value:0.35,),


            );

          });
    }
  }

  void sliderChanged(double value) {
    print(value);
  }
}

       */

/*
class MyAppState extends State<MyApp> {
  var _value=false;
  var inc=0;
  onchange(bool value){
    setState((){
     inc++;
     _value=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body : new Column(children: <Widget>[
        new Switch(value: _value, onChanged: (bool value)=>onchange(value)),
        new Center(child: new Text("value ${inc}"),)
      ],)
    );
  }
}
 */
