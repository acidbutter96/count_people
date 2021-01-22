import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: "Contar Pessoas", home: Home()));
}

// Widths stateful e stateless (armazenam estados e não armazenam)
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 2;
  String _message = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;
    });
  }

  void _changeText() {
    setState(() {
      if (_people < 0) {
        _message = "Mundo alternativo?";
      } else if(_people<11) {
        _message = "Pode Entrar!";
      }else{
        _message = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          //Eixo abssiço da coluna é o mainAxe
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextButton(
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () {
                        //função anônima
                        _changePeople(1);
                        _changeText();
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextButton(
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () {
                        //função anônima
                        _changePeople(-1);
                        _changeText();
                      },
                    ))
              ],
            ),
            Text(_message,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}
