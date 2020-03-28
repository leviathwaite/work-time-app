import 'package:flutter/material.dart';
import 'package:flutterworktimeapp/toggle_switch.dart';
import 'package:intl/intl.dart';

class DayListView extends StatelessWidget {
  const DayListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _dayListView(context);
  }
}

void onTap()
{
  // TODO toggle working
  // might not use this
}

void onLongPress()
{
  // TODO open day detail view
}

Widget _dayListView(BuildContext context) {
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

  Color enabledColor = Colors.green;
  Color disabledColor = Colors.grey;

  return ListView.builder(
    itemCount: dayNames.length,
    itemBuilder: (context, index) {
      DateTime _dateTime = DateTime.now();

      return ListTile(
        dense: true,

        title: Text(DateFormat('EEEE, d')
            .format(_dateTime.subtract(Duration(days: _dateTime.weekday - index)))),
        // title: Text(dayNames[index]),
        // trailing: Icon(Icons.more_vert),
        trailing: Icon(Icons.edit),
        leading: ToggleSwitch(),
        onTap: () {
          onTap();
        },
        onLongPress: () {
          onLongPress();
        },
      );
    },
  );


}

  /*
  ListTile(
            // leading: Icon(Icons.calendar_view_day),
            // enabled: false,
            dense: true,
            // TODO find a leading icon
            // leading: Text(DateFormat('EEEE, d').format(_dateTime)),
            // leading: Text(mondaysDate.toString()),
            title: Text(DateFormat('EEEE, d').format(_dateTime.subtract(Duration(days: _dateTime.weekday - 2)))),
            // title: Icon(Icons.note_add),
            // trailing: Icon(Icons.edit),
            trailing: Icon(Icons.more_vert),
              onTap: () {
                onTapOpenDayView(2);
              },
              onLongPress: (){
                // do something else
              },
          )
   */

