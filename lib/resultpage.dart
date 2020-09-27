import 'package:flutter/material.dart';
import 'package:quizzer/home.dart';

class resultpage extends StatefulWidget {
  int ma;
  resultpage({Key key, this.ma}) : super(key: key);

  @override
  _resultpageState createState() => _resultpageState(ma);
}

class _resultpageState extends State<resultpage> {
  int ma;
  _resultpageState(this.ma);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRRect(
                          child: Image(image: AssetImage("images/wd.png")),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 15.0,
            ),
            child: Center(
              child: Text(
                "You Scored $ma in A!!!",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Quando",
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => homepage()));
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    borderSide:
                        BorderSide(width: 5.0, color: Colors.amberAccent),
                    splashColor: Colors.yellowAccent,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
