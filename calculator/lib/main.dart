import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iPhone Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _result = '0';
  String _operation = '';
  double _firstNumber = 0;
  double _secondNumber = 0;

  void _onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      _firstNumber = 0;
      _secondNumber = 0;
      _operation = '';
    } else if (buttonText == '+' || buttonText == '-' || buttonText == 'x' || buttonText == '/') {
      _firstNumber = double.parse(_output);
      _operation = buttonText;
      _output = '0';
    } else if (buttonText == '=') {
      _secondNumber = double.parse(_output);

      if (_operation == '+') {
        _result = (_firstNumber + _secondNumber).toString();
      } else if (_operation == '-') {
        _result = (_firstNumber - _secondNumber).toString();
      } else if (_operation == 'x') {
        _result = (_firstNumber * _secondNumber).toString();
      } else if (_operation == '/') {
        _result = (_firstNumber / _secondNumber).toString();
      }

      _output = _result;
      _operation = '';
    } else {
      _output = _output == '0' ? buttonText : _output + buttonText;
    }

    setState(() {});
  }

  Widget _buildButton(String buttonText, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            backgroundColor: color,
          ),
          onPressed: () => _onButtonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Text(
              _output,
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  _buildButton('C', Colors.grey),
                  _buildButton('+/-', Colors.grey),
                  _buildButton('%', Colors.grey),
                  _buildButton('/', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('7', Colors.grey[850]!),
                  _buildButton('8', Colors.grey[850]!),
                  _buildButton('9', Colors.grey[850]!),
                  _buildButton('x', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('4', Colors.grey[850]!),
                  _buildButton('5', Colors.grey[850]!),
                  _buildButton('6', Colors.grey[850]!),
                  _buildButton('-', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('1', Colors.grey[850]!),
                  _buildButton('2', Colors.grey[850]!),
                  _buildButton('3', Colors.grey[850]!),
                  _buildButton('+', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          padding: EdgeInsets.fromLTRB(34, 20, 34, 20),
                          backgroundColor: Colors.grey[850],
                        ),
                        onPressed: () => _onButtonPressed('0'),
                        child: Text(
                          '0',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  _buildButton('.', Colors.grey[850]!),
                  _buildButton('=', Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}