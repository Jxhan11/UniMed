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
          titleTextStyle: TextStyle(
              color: Color(0xFF242424), fontSize: 30, letterSpacing: 2),
        ),
        textTheme: TextTheme(
          // bodyLarge:
          //     TextStyle(fontFamily: "PSB",),
          // bodyMedium:
          //     TextStyle(fontFamily: "PSM",),
          // bodySmall:
          //     TextStyle(fontFamily: "PSL",),
          headline1: TextStyle(color: Colors.deepPurpleAccent,fontFamily: "PSL"),
          headline2: TextStyle(color: Colors.deepPurpleAccent,fontFamily: "PSL"),
          bodyText2: TextStyle(fontFamily: "PSL",fontWeight: FontWeight.w400),
          // bodyText1: TextStyle(color: Colors.blue),
          subtitle1: TextStyle(fontFamily: "PSM",fontWeight: FontWeight.w300),
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xFF1C1C1C),
                radius: 20,
                child: Container(
                  height: 37,
                  width: 37,
                  decoration: BoxDecoration(color: Color(0xFFF1F1F1),borderRadius: BorderRadius.circular(100)),
                  child: Center(child: Text("   U   ",style: TextStyle(color: Colors.black,fontFamily: "PSB",fontSize: 15),)),
                ),
              ),

              Expanded(child: Container(),),
              IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Colors.black,splashRadius: 20,),
              IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined),color: Colors.black,splashRadius: 20,),
            ],
          ),
          elevation: 0,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Ads(),
            EmergencyCards(),
            DailyNeeds(),
            PreviouslyOrdered(),
            // FreqBought(),
            // FilledCard(),
          ],
        ));
  }
}

///////////////////////////////////////END OF MAIN FUNCTION HERE/////////////////////////////////////////////////

class DailyNeeds extends StatefulWidget {
  const DailyNeeds({Key? key}) : super(key: key);

  @override
  State<DailyNeeds> createState() => _DailyNeedsState();
}

class _DailyNeedsState extends State<DailyNeeds> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 315,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Title2(title: "Daily Needs")),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FilledCard(
                        ProductName: "Cat",
                        Price: 250,
                        onTap: doNothing(),
                        ProductImg: "https://placekitten.com/500/500"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  doNothing() {}
}

class PreviouslyOrdered extends StatefulWidget {
  const PreviouslyOrdered({Key? key}) : super(key: key);

  @override
  State<PreviouslyOrdered> createState() => _PreviouslyOrderedState();
}

class _PreviouslyOrderedState extends State<PreviouslyOrdered> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Title2(title: "Past Orders")),
            WideFilledCard(
              ProductName: "Cat",
              Price: 250,
              onTap: doNothing(),
              ProductImg: "https://placekitten.com/500/500",
              PurchaseDate: "a few days ago",
              Seller: "Delivered by uwu",
            ),
            WideFilledCard(
              ProductName: "Cat",
              Price: 250,
              onTap: doNothing(),
              ProductImg: "https://placekitten.com/500/500",
              PurchaseDate: "a few days ago",
              Seller: "Delivered by uwu",
            ),
          ],
        ),
      ),
    );
  }

  doNothing() {}
}

class FreqBought extends StatefulWidget {
  const FreqBought({Key? key}) : super(key: key);

  @override
  State<FreqBought> createState() => _FreqBoughtState();
}

class _FreqBoughtState extends State<FreqBought> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Title2(title: "Frequently Bought")),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 8.0, // Spacing between columns
              mainAxisSpacing: 8.0, // Spacing between rows
            ),
            itemCount: 10, // Total number of items
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.blueGrey,
                child: Center(
                  child: Text('Item $index'),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  doNothing() {}
}

class Ads extends StatefulWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.amber,
      height: 150,
      margin: EdgeInsets.all(10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFF8E8E),
                  borderRadius: BorderRadius.circular(15)),
              width: 110,
              height: 110,
              // color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.emergency),
                      iconSize: 30,
                      color: Color(0xFFA00000),
                    ),
                    Text(
                      "Emergency",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFA00000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black54)),
              width: 110,
              height: 110,
              // color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.healing),
                      iconSize: 30,
                      color: Colors.black,
                    ),
                    Text(
                      "First Aid",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black54)),
              width: 110,
              height: 110,
              // color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.credit_card),
                      iconSize: 30,
                      color: Colors.black,
                    ),
                    Text(
                      "Credentials",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
