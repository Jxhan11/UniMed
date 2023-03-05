
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {

   runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title of the application
      title: 'Hello World Demo Application',
      // theme of the widget

      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: "ProductSans",
        appBarTheme: AppBarTheme(
          color: Color(0xFFEEEEE),
          titleTextStyle: TextStyle(color: Color(0xFF242424),fontSize: 30,letterSpacing: 2),
        ),
      ),
      // Inner UI of the application
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("+",style: TextStyle(fontFamily: 'BalticH',fontSize: 35,color: Color(0xFFFF4747))),
            Text("U",style: TextStyle(fontFamily: 'BalticH',fontSize: 35,)),
            SizedBox(width: 3,),
            Text("M",style: TextStyle(fontFamily: 'BalticC',fontSize: 35),),
          ],
        ),
        elevation: 0,
      ),
      body:Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Ads(),

        ],
      )

    );
  }
}

class Ads extends StatefulWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      width: screenWidth,
      color: Color(0xFFCACACA),
      child: Center(
        child: Text(
          "Ads",
          style: TextStyle(
            fontSize: 40,

          ),
        ),
      ),
    );
  }
}


