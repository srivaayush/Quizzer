import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzer/resultpage.dart';

class getjason extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/dosha.json"),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());

        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  var mydata;

  quizpage({Key key, @required this.mydata}) : super(key: key);

  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {
  var mydata;
  _quizpageState(this.mydata);

  Color colortoshow = Colors.amberAccent;
  Color vatacol = Colors.blue;
  Color pittacol = Colors.red;
  Color kaphacol = Colors.green;
  Map<String, Color> btncolor = {
    "a)": Colors.amberAccent,
    "b)": Colors.amberAccent,
    "c)": Colors.amberAccent,
  };
  int ma = 0, mb = 0, mc = 0;
  int i = 1;
  int timer = 30;
  String showtimer = "30";

  @override
  void initState() {
    // TODO: implement initState
    starttimer();
    super.initState();
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else {
          timer = timer - 1;
        }
        showtimer.toString();
      });
    });
  }

  void nextquestion() {
    setState(() {
      if (i <= 3) {
        i++;
        print(i);
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(ma: ma),
        ));
      }
    });

    btncolor["a)"] = Colors.amberAccent;
    btncolor["b)"] = Colors.amberAccent;
    btncolor["c)"] = Colors.amberAccent;
  }

  void checkanswer(String k) {
    if (k == "a)") {
      ma++;
      colortoshow = vatacol;
    }
    if (k == "b)") {
      mb++;
      colortoshow = pittacol;
    }
    if (k == "c)") {
      mc++;
      colortoshow = kaphacol;
    }
    setState(() {
      btncolor[k] = colortoshow;
    });
    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: MaterialButton(
          onPressed: () => checkanswer(k),
          child: Text(
            mydata[1][i.toString()][k],
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Alike",
            ),
            // maxLines: 2,
          ),
          color: btncolor[k],
          splashColor: Colors.green[700],
          highlightColor: Colors.indigo[700],
          minWidth: 200.0,
          height: 45.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return WillPopScope(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      mydata[0][i.toString()],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Quando",
                      ),
                    ),
                  )),
              Expanded(
                  flex: 6,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        choicebutton("a)"),
                        choicebutton("b)"),
                        choicebutton("c)"),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: Text(
                        showtimer,
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      "Quizzerr",
                    ),
                    content: Text("You can't go back at this stage!"),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "OK",
                          ))
                    ],
                  ));
        });
  }
}
