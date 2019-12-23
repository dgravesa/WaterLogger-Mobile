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
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _amount = 0;
  String _amountText;

  TextEditingController drinkInputAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this._amountText = _buildAmountText(_amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Today's total:",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  alignment: Alignment.center,
                  child: Text(
                    _amountText,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 84.0,
                    ),
                  )),
              TextField(
                controller: drinkInputAmountController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(hintText: "Enter amount (oz)"),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  child: Text(
                    "Drink",
                  ),
                  onPressed: () => _handleDrinkInput(),
                ),
              )
            ],
          ),
        ));
  }

  void _handleDrinkInput() {
    var inputAmountText = drinkInputAmountController.text;

    if (inputAmountText.isNotEmpty) {
      var drinkAmount = double.parse(inputAmountText);

      _clearInputAmountField();

      var newAmount = _amount + drinkAmount;
      var newAmountText = _buildAmountText(newAmount);

      setState(() {
        this._amount = newAmount;
        this._amountText = newAmountText;
      });
    }
  }

  String _buildAmountText(double amount) {
    String displayAmount;

    if (amount > 1000) {
      displayAmount = (amount / 1000.0).toStringAsFixed(1) + "k";
    } else {
      displayAmount = amount.toStringAsFixed(1);
    }

    return displayAmount + ' oz';
  }

  _clearInputAmountField() => drinkInputAmountController.text = '';
}
