
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:unimed/Components/usefulStuff.dart';

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
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: "ProductSans",fontWeight:FontWeight.w700 ),
          bodyMedium: TextStyle(fontFamily: "ProductSans",fontWeight:FontWeight.w500 ),
          bodySmall: TextStyle(fontFamily: "ProductSans",fontWeight:FontWeight.w100 ),
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
            Text("++",style: TextStyle(fontFamily: 'BalticH',fontSize: 35,color: Color(0xFFFF4747))),
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
          EmergencyCards(),
          // FilledCard(),

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
    final PageController controller = PageController();
    return SizedBox(
      width: screenWidth,
      height: 240,
      child: PageView(
        controller: controller,
        children: <Widget>[
          Container(
            color: Colors.amber,
            width: screenWidth,
            height: 200,
            child: Center(
              child: Text("This is Ad section 1 ( Drag and Scroll Bro"),
            ),
          ),
          Container(
            color: Color(0xFF1B5B81),
            width: screenWidth,
            height: 200,
            child: Center(
              child: Text("This is Ad section 2"),
            ),
          ),
          Container(
            color: Colors.blue,
            width: screenWidth,
            height: 200,
            child: Center(
              child: Text("This is Ad section 3"),
            ),
          ),
          Container(
            color: Colors.redAccent,
            width: screenWidth,
            height: 200,
            child: Center(
              child: Text("This is Ad section 4"),
            ),
          ),
        ],
      ),
    );
  }
}

class EmergencyCards extends StatefulWidget {
  const EmergencyCards({Key? key}) : super(key: key);

  @override
  State<EmergencyCards> createState() => _EmergencyCardsState();
}

class _EmergencyCardsState extends State<EmergencyCards> {
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.amber,
      height: 150,
      margin: EdgeInsets.all(10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Color(0xFFFF8E8E),borderRadius: BorderRadius.circular(15)),
              width: 110,
              height: 110,
              // color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(onPressed: null, icon: Icon(Icons.ice_skating),iconSize: 30,),
                    Text("Emergency",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.black54)),
              width: 110,
              height: 110,
              // color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(onPressed: null, icon: Icon(Icons.local_hospital_outlined),iconSize: 30,),
                    Text("First Aid",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.black54)),
              width: 110,
              height: 110,
              // color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(onPressed: null, icon: Icon(Icons.credit_card),iconSize: 30,),
                    Text("Credentials",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    ) ;
  }
}



