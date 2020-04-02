import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// TODO not used

// https://dev.to/newtonmunene_yg/dart-getters-and-setters-1c8f

class ToggleSwitch extends StatelessWidget
{
  ToggleSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return _toggleSwitch(context);
  }
}

String onString = "";
String offString = "";

void onSwitched()
{
  SnackBar snackBar = SnackBar(
      content: Text(isSwitchedOn ? onString : offString),
  );
}

bool isSwitchedOn = false;

Widget _toggleSwitch(BuildContext context)
{
  var isSwitched;

  return Switch(
      value: isSwitchedOn,
      onChanged: (value)
      {
        onSwitched();
      });
}

/*
  child: Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
   */
