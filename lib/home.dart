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
          color: Color(0xffd8dee5),
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
                    "According to Ayurveda human body is governed primarily by three Doshas:- \n VATA ,PITTA, KAPHA \n    Analyze your dosha simply by answering few questions.",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xff192A56),
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Alike"),
                  ),
                ),
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
      drawer: Drawer(
          child: Container(
        color: Color(0xffE0E0E0),
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                // color: Color(0xffFFc107),
                padding: EdgeInsets.only(top: 0),
                child: Center(
                  child: Text(
                    "Hello Fraaands!\n Welcome!",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2.5,
              color: Colors.white,
            ),
            // UserAccountsDrawerHeader(
            //   accountName: Text("Hello Guys!"),
            //   accountEmail: Text("Welcome!"),
            //   currentAccountPicture: CircleAvatar(
            //     backgroundColor: Colors.black87,
            //   ),
            // ),
            ListTile(
              title: Text("Dark Mode"),
              trailing: Icon(Icons.settings_cell),
              // leading: CircleAvatar(child: Text("B")),
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              title: Text("About"),
              trailing: Icon(Icons.help),
              // leading: CircleAvatar(child: Text("B")),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.white,
            ),
            ListTile(
              title: Text("Privacy Policy"),
              // subtitle: miniicon(Icons.security),
              trailing: Icon(Icons.security),
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              title: Text("Rate Us"),
              trailing: Icon(Icons.star),
              // leading: CircleAvatar(child: Text("B")),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.white,
            ),
            ListTile(
              title: Text("Contact Us"),
              trailing: Icon(Icons.contact_mail),
              // leading: CircleAvatar(child: Text("B")),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.white,
            ),
            ListTile(
              title: Text("Close"),
              subtitle: Text("CLoses Window"),
              trailing: Icon(Icons.close),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.white,
            ),
          ],
        ),
      )),
      appBar: AppBar(
        title: Text(
          "Quizzerrr",
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xff502d8c),
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
