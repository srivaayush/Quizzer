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

  Color colortoshow = Colors.green;
  Color vatacol = Colors.blue;
  Color pittacol = Colors.red;
  Color kaphacol = Colors.green;
  Map<String, Color> btncolor = {
    "a)": Colors.amber[100],
    "b)": Colors.amber[100],
    "c)": Colors.amber[100],
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
      if (i <= 1) {
        i++;
        print(i);
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(ma: ma),
        ));
      }
    });

    btncolor["a)"] = Colors.amber[100];
    btncolor["b)"] = Colors.amber[100];
    btncolor["c)"] = Colors.amber[100];
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
    Timer(Duration(microseconds: 1000000), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          onPressed: () => checkanswer(k),
          child: Text(
            k + " " + mydata[1][i.toString()][k],
            style: TextStyle(
              fontSize: 28.0,
              fontFamily: "Alike",
            ),
            // maxLines: 2,
          ),
          color: btncolor[k],
          splashColor: Colors.green[700],
          highlightColor: Colors.indigo[700],
          minWidth: 200.0,
          height: 100.0,
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
                    padding: EdgeInsets.only(top: 60.0, left: 40, right: 40),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      mydata[0][i.toString()],
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: "Quando",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
