import 'package:flutter/material.dart';
import 'package:flutterworktimeapp/day_listView.dart';
import 'package:intl/intl.dart';

// https://stackoverflow.com/questions/54371874/how-get-the-name-of-the-days-of-the-week-in-dart
// https://codeburst.io/top-7-date-methods-you-should-know-dart-6ce2b5f67090
// https://api.flutter.dev/flutter/intl/DateFormat-class.html
// https://pusher.com/tutorials/flutter-listviews

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Time',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Week View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int _dayId;

  static DateTime _dateTime = DateTime.now();
  static var mondayDayNumber = 1;
  static var currentDayNumber = _dateTime.weekday;

  static var dateOffset = -currentDayNumber + mondayDayNumber;
  static var mondaysDate =
      _dateTime.subtract(Duration(days: _dateTime.weekday - mondayDayNumber));

  // static var dayOfWeekMonday = 1;
  var lastMonday = _dateTime
      .subtract(Duration(days: _dateTime.weekday - 1)); //.toIso8601String();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: Icon(Icons.navigation),
        title: Text(widget.title),
        // trailing: Icon(Icons.arrow_right)
      ),
      body: DayListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
