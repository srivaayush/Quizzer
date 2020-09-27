import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzer/quizpage.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> images = ["images/dosha.jpg", "images/guna.jpg"];
  Widget customcard(String nam, String image) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjason(),
          ));
        },
        child: Material(
          color: Colors.amber[100],
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    nam,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontFamily: "Alike",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Description rfru3foygoi3rfcgy3frcyugo3frcdogyu3rdcexfyogu3crf",
                    style: TextStyle(
                        fontSize: 15.0, color: Colors.red, fontFamily: "Alike"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quizzerrr",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: "Alike-Regular",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("DOSHA", images[0]),
          customcard("GUNA", images[1]),
        ],
      ),
    );
  }
}
