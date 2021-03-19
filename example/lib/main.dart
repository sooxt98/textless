import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextLess',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TextLess'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: "TextLess".toUpperCase().h5.letterSpacing(15).light,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            "Headline1".h1.overflowFade,
            "Headline2".h2,
            "Headline3".h3,
            "Headline4".h4,
            "Headline5".h5,
            "Headline6".h6,
            "Subtitle1".s1,
            "Subtitle1".s2,
            "BodyText1".b1,
            "BodyText2".b2,
            "Button".btn,
            "Caption".cap,
            "Overline".ol,
          ],
        ),
      ),
    );
  }
}
