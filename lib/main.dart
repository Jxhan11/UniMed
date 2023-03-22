import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimed/Pages/filesPage.dart';
import 'package:unimed/Pages/healthPage.dart';
import 'package:unimed/Pages/profilePage.dart';
import 'dart:ui';
import 'theme_constants.dart';

import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/Pages/searchWithSuggestions.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
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
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
        fontFamily: "ProductSans",
        appBarTheme: AppBarTheme(
          color: Color(0xFFEEEEE),
          titleTextStyle: TextStyle(
              color: Color(0xFF242424), fontSize: 22, letterSpacing: 2),
        ),
        textTheme: TextTheme(
          // bodyLarge:
          //     TextStyle(fontFamily: "PSB",),
          // bodyMedium:
          //     TextStyle(fontFamily: "PSM",),
          // bodySmall:
          //     TextStyle(fontFamily: "PSL",),
          headline1:
              TextStyle(color: Colors.deepPurpleAccent, fontFamily: "PSM"),
          headline2:
              TextStyle(color: Colors.deepPurpleAccent, fontFamily: "PSM"),
          bodyText2: TextStyle(fontFamily: "PSM"),
          // bodyText1: TextStyle(color: Colors.blue),
          subtitle1: TextStyle(fontFamily: "PSM"),
        ),
      ),
      darkTheme: AppTheme().darkTheme,
      // Inner UI of the application
      themeMode: ThemeMode.system,
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
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    //TODO: Change system's navigation bar colors with dark and light mode. Make it navigation bar color somehow
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //       systemNavigationBarColor: Colors.white
    //   )
    // );
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BodyFormerFunction(_selectedIndex, context),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(Icons.home_outlined),
              icon: Icon(Icons.home),
              label: 'Home',
          ),
          NavigationDestination(
              icon: Icon(Icons.favorite),
              selectedIcon: Icon(Icons.favorite_border),
              label: 'Health'
          ),
          NavigationDestination(
              icon: Icon(Icons.file_copy_rounded),
              selectedIcon: Icon(Icons.file_copy_outlined),
              label: 'Files'
          ),
          NavigationDestination(
              icon: Icon(Icons.person_rounded),
              selectedIcon: Icon(Icons.person_outline_rounded),
              label: 'Profile'
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        elevation: 10.0,
      ),
    );
  }
}

///////////////////////////////////////END OF MAIN FUNCTION HERE/////////////////////////////////////////////////

BodyFormerFunction(x,context) {
  // ONLY PURPOSE IS TO CHANGE THE CONTENTS OF THE BODY
  switch(x){
    case 0:
      // Home page
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            collapsedHeight: 60,
            title: Padding(
              //TODO: Make the padding and height relative.
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Color(0xFF303030),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SearchWithSuggestionsPage()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Container(
                          child: Row(
                            children: [
                              Hero(
                                tag: 'search-icon-leading',
                                child: Material(
                                  color: Colors.transparent,
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: Theme.of(context).brightness ==
                                        Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Hero(
                                tag: 'search-text',
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    "Search for healthcare facilities",
                                    style: TextStyle(
                                      fontFamily: 'PSL',
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).brightness == Brightness.dark? Color(0xFFFF8E8E): Colors.red,
                        radius: 18,
                        child: Icon(Icons.person_rounded,),
                      ),
                    ),
                    // SizedBox(width: 1,),
                  ],
                ),
              ),
            ),
          ),
          SubHeadlines(text: 'Records'),
          SliverToBoxAdapter(
            child: RecordCards(),
          ),
          EmergencyBoxes(),
          SubHeadlines(text: 'For you'),
          ForYouCards(),
        ],
      );
      break;
    case 1:
      // Health Page
      return HealthPageWidgets();
      break;
    case 2:
      // Files Page
      return FilesPageWidgets();
      break;
    case 3:
      // ProfilePage
      return ProfilePageWidgets();
      break;
  }

}

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

///////////////////////////////////////NEW UNIMED APP FUNCTIONS/////////////////////////////////////////////////

class RecordCards extends StatefulWidget {
  const RecordCards({Key? key}) : super(key: key);

  @override
  State<RecordCards> createState() => _RecordCardsState();
}

class _RecordCardsState extends State<RecordCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black12,
      padding: EdgeInsets.only(left: 16, top: 8),
      height: 140,
      child: Container(
        child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.transparent,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 216,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              width: double.infinity,
                              child: Text(
                                "Resting Heart Rate",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFFF8E8E):Color(0xFFA00000), fontSize: 17),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              width: double.infinity,
                              child: Text(
                                "99 Bpm",
                                style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030)),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 216,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              width: double.infinity,
                              child: Text(
                                "Active Hours",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFCEFF9D):Color(0xFF5BAE07), fontSize: 17),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              width: double.infinity,
                              child: Text(
                                "50 s",
                                style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030)),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 216,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              width: double.infinity,
                              child: Text(
                                "Sleep",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFA7B5FF):Color(0xFF334DD3), fontSize: 17),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              width: double.infinity,
                              child: Text(
                                "7h 20m",
                                style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030)),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubHeadlines extends StatelessWidget {
  const SubHeadlines({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Container(
            padding: EdgeInsets.only(left: 30),
            width: double.infinity,
            child: Text(
              text,
              style: TextStyle(fontSize: 17, letterSpacing: 1.5),
            )),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}

class EmergencyBoxes extends StatelessWidget {
  const EmergencyBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color(0xFFFF8E8E),
                  borderRadius: BorderRadius.circular(10)),
              width: 110,
              height: 120,
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
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color:Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 110,
              height: 120,
              // color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.healing),
                      iconSize: 30,
                      color:Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030),
                    ),
                    Text(
                      "First Aid",
                      style:
                          TextStyle(fontSize: 15,color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030),),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color:Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 110,
              height: 120,
              // color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.credit_card),
                      iconSize: 30,
                      color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030),
                    ),
                    Text(
                      "Credentials",
                      style: TextStyle(fontSize: 15,color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030),),
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

class ForYouCards extends StatelessWidget {
  const ForYouCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(25),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  offset: Offset(-.5,2),
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 10),
            height: 110,
            width: 340,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    // padding: EdgeInsets.only(left: 5,top:20,right:10),
                    child: Row(children: <Widget>[
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        fillColor: Theme.of(context).brightness == Brightness.dark ? Color(0xFF474747):Color(0xFFE3E3E3),
                        child: Icon(
                          Icons.newspaper,
                          size: 25.0,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                      Text('Insurance Plans',style: TextStyle(fontSize: 20,fontFamily: "PSL",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)
                    ],),
                  ),
                ),

              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(25),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  offset: Offset(-.5,2),
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 10),
            height: 110,
            width: 340,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    // padding: EdgeInsets.only(left: 5,top:20,right:10),
                    child: Row(children: <Widget>[
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        fillColor: Theme.of(context).brightness == Brightness.dark ? Color(0xFF474747):Color(0xFFE3E3E3),
                        child: Icon(
                          Icons.newspaper,
                          size: 25.0,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                      Text('Link with Blood Bank',style: TextStyle(fontSize: 20,fontFamily: "PSL",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)
                    ],),
                  ),
                ),

              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(25),
               boxShadow: <BoxShadow>[
                 BoxShadow(
                   color: Colors.black12,
                   blurRadius: 2,
                   offset: Offset(-.5,2),
                ),
               ],
            ),
            margin: EdgeInsets.only(top: 10),
            height: 110,
            width: 340,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    // padding: EdgeInsets.only(left: 5,top:20,right:10),
                    child: Row(children: <Widget>[
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        fillColor: Theme.of(context).brightness == Brightness.dark ? Color(0xFF474747):Color(0xFFE3E3E3),
                        child: Icon(
                          Icons.newspaper,
                          size: 25.0,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                      Text('Gib Organ plis',style: TextStyle(fontSize: 20,fontFamily: "PSL",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)
                    ],),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
