import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'contador de pessoas',
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = 'pode entrar!';

  _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _people = 0;
      } else if (_people < 10) {
        _infoText = 'Ha vagas';
      } else {
        _infoText = 'Lotado';
        _people = 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/restaurant.jpg',
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  _infoText,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                height: 120.0,
              ),
              Container(
                child: Text(
                  'Pessoas: $_people',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text('+1',
                          style: TextStyle(fontSize: 40, color: Colors.white)),
                      onPressed: () {
                        _changePeople(1);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text('-1',
                          style: TextStyle(fontSize: 40, color: Colors.white)),
                      onPressed: () {
                        _changePeople(-1);
                      },
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
