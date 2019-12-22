import 'package:flutter/material.dart';

void main() => runApp(WaterLoggerApp());

class WaterLoggerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WaterLogger',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(title: 'WaterLogger'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double amount = 32;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Text(
                amount.toString() + ' oz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 92.0,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter amount (oz)',
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Drink',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                )
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.lightBlue,
            )
          )
        ],
      )
    );
  }
}
