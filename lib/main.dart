import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimed/Pages/EmergencyPage.dart';
import 'package:unimed/Pages/FirstAid.dart';
import 'package:unimed/Pages/Insurance.dart';
import 'package:unimed/Pages/News.dart';
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
      debugShowCheckedModeBanner: false,
      // title of the application
      title: 'Hello World Demo Application',
      // theme of the widget

      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color(0xFFF2F3F5),
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

        backgroundColor: Theme.of(context).brightness==Brightness.dark? Color(0xFF303030):Color(0xFFF2F2F2),
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
          ),
          NavigationDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: 'Health'
          ),
          NavigationDestination(
              icon: Icon(Icons.file_copy_outlined),
              selectedIcon: Icon(Icons.file_copy_rounded),
              label: 'Files'
          ),
          NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded),
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
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Theme.of(context).scaffoldBackgroundColor,statusBarIconBrightness: Theme.of(context).brightness==Brightness.dark? Brightness.light:Brightness.dark),
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
                        child: ClipOval(
                          child: Image(
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            image: NetworkImage("https://i.pinimg.com/originals/39/26/db/3926db089d7af5fa91711db1dbb82b7c.jpg"),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(width: 1,),
                  ],
                ),
              ),
            ),
          ),
          SubHeadlines(text: 'Health'),
          SliverToBoxAdapter(
            child: RecordCards(),
          ),
          EmergencyBoxes(),
          SubHeadlines(text: 'For you'),
          SliverToBoxAdapter(child: ForYouCards()),
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



///////////////////////////////////////NEW UNIMED APP FUNCTIONS/////////////////////////////////////////////////

class RecordCards extends StatefulWidget {
  const RecordCards({Key? key}) : super(key: key);

  @override
  State<RecordCards> createState() => _RecordCardsState();
}

class _RecordCardsState extends State<RecordCards> {

  @override

  Widget build(BuildContext context) {
    GeneralizedPadding test = GeneralizedPadding(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.black12,
      // padding: EdgeInsets.only(left: 16, top: 8,right: 16),
      height: 120,
      child: Container(
        child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  child: Container(
                    margin: EdgeInsets.only(right: test.horizontal(value: 8)),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark ? DBoxFill:LBoxFill,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: screenWidth/2 + 10,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height:20 ,
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
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  child: Container(
                    margin: EdgeInsets.only(right: test.horizontal(value: 8)),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark ? DBoxFill:LBoxFill,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width:screenWidth/2 + 10,
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
                padding: const EdgeInsets.only(left: 10,right: 20),
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark ? DBoxFill:LBoxFill,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: screenWidth/2 + 10,
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          // color: Colors.amber,
          // width: 500,
          padding: EdgeInsets.only(left: 15,right: 15,top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyPage()));

                },
                borderRadius: BorderRadius.circular(10),
                onLongPress: (){
                  HapticFeedback.heavyImpact();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0xFFFF8E8E),
                      borderRadius: BorderRadius.circular(10)),
                  width:screenWidth/3.4 ,
                  height: 120,
                  // color: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyPage()));
                          },
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
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onLongPress: (){
                  HapticFeedback.heavyImpact();
                },
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  News()),);
                },
                child: Container(
                  // margin: EdgeInsets.only(),
                  decoration: BoxDecoration(
                    color:Theme.of(context).brightness == Brightness.dark ? DBoxFill:LBoxFill,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: screenWidth/3.4,
                  height: 120,
                  // color: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>News()));
                          },
                          icon: Icon(Icons.newspaper),
                          iconSize: 30,
                          color:Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030),
                        ),
                        Text(
                          "News",
                          style:
                              TextStyle(fontSize: 15,color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FirstAid()));

                },
                borderRadius: BorderRadius.circular(10),
                onLongPress: (){
                  HapticFeedback.heavyImpact();
                },
                child: Container(
                  // margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color:Theme.of(context).brightness == Brightness.dark ? DBoxFill:LBoxFill,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: screenWidth/3.4,
                  height: 120,
                  // color: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FirstAid()));

                          },
                          icon: Icon(Icons.health_and_safety),
                          iconSize: 30,
                          color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030),
                        ),
                        Text(
                          "First Aid",
                          style: TextStyle(fontSize: 15,color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF303030),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ForYouCards extends StatelessWidget {
//   const ForYouCards({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Container(
//         // color: Colors.amber,
//         padding: EdgeInsets.only(left: 20,right:20),
//         height: 200,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(image: NetworkImage("https://th.bing.com/th/id/OIP.3HZOOl0lErndPeHwv2Ih3AHaFG?pid=ImgDet&w=207&h=143&c=7&dpr=1.3"),fit: BoxFit.fill,colorFilter:  ColorFilter.mode(Colors.white.withOpacity(0.0), BlendMode.dstATop),),
//                       // color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: Theme.of(context).brightness == Brightness.dark? Colors.white38:Colors.black45,width: 0.5)
//                     // boxShadow: <BoxShadow>[
//                     //   BoxShadow(
//                     //     color: Colors.black12,
//                     //     // blurRadius: 1,
//                     //     offset: Oaffset(-.5,2),
//                     //   ),
//                     // ],
//                   ),
//                   margin: EdgeInsets.only(top: 10),
//                   height: 160,
//                   width: 250,
//                   child:  Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           // padding: EdgeInsets.only(left: 5,top:20,right:10),
//                           child: Column(children: <Widget>[
//                             // RawMaterialButton(
//                             //   onPressed: () {},
//                             //   elevation: 0,
//                             //   fillColor: Theme.of(context).brightness == Brightness.dark ? Color(0xFF474747):Color(0xFFE3E3E3),
//                             //   child: Icon(
//                             //     Icons.newspaper,
//                             //     size: 25.0,
//                             //   ),
//                             //   padding: EdgeInsets.all(15.0),
//                             //   shape: CircleBorder(),
//                             // ),
//                             Container(padding: EdgeInsets.only(left: 20), width: double.infinity, child: Text('Insurance',textAlign: TextAlign.left, style: TextStyle(fontSize: 22,fontFamily: "PSM",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)),
//                             Container(padding: EdgeInsets.only(left: 20), width: double.infinity, child: Text('Plans',textAlign: TextAlign.left, style: TextStyle(fontSize: 22,fontFamily: "PSM",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)),
//                             SizedBox(height: 10,),
//                             Container(padding: EdgeInsets.only(left: 20), width: double.infinity, child: Text('25 Plans',textAlign: TextAlign.left, style: TextStyle(fontSize: 15,fontFamily: "PSXL",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)),
//
//                           ],),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(width: 8,),
//             Column(
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(image: NetworkImage("https://th.bing.com/th/id/OIP.36tkpsg_KY_R1JIfPKO8jAHaF7?w=211&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),fit: BoxFit.fill,colorFilter: Theme.of(context).brightness ==Brightness.dark? ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop):ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.dstATop)),
//                       // color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: Colors.black54,width: 0.2)
//                     // boxShadow: <BoxShadow>[
//                     //   BoxShadow(
//                     //     color: Colors.black12,
//                     //     // blurRadius: 1,
//                     //     offset: Oaffset(-.5,2),
//                     //   ),
//                     // ],
//                   ),
//                   margin: EdgeInsets.only(top: 10),
//                   height: 160,
//                   width: 250,
//                   child:  Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           // padding: EdgeInsets.only(left: 5,top:20,right:10),
//                           child: Column(children: <Widget>[
//                             // RawMaterialButton(
//                             //   onPressed: () {},
//                             //   elevation: 0,
//                             //   fillColor: Theme.of(context).brightness == Brightness.dark ? Color(0xFF474747):Color(0xFFE3E3E3),
//                             //   child: Icon(
//                             //     Icons.newspaper,
//                             //     size: 25.0,
//                             //   ),
//                             //   padding: EdgeInsets.all(15.0),
//                             //   shape: CircleBorder(),
//                             // ),
//                             Container(padding: EdgeInsets.only(left: 20), width: double.infinity, child: Text('Insurance',textAlign: TextAlign.left, style: TextStyle(fontSize: 22,fontFamily: "PSM",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)),
//                             Container(padding: EdgeInsets.only(left: 20), width: double.infinity, child: Text('Plans',textAlign: TextAlign.left, style: TextStyle(fontSize: 22,fontFamily: "PSM",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)),
//                             SizedBox(height: 10,),
//                             Container(padding: EdgeInsets.only(left: 20), width: double.infinity, child: Text('25 Plans',textAlign: TextAlign.left, style: TextStyle(fontSize: 15,fontFamily: "PSXL",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)),
//
//                           ],),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(width: 8,),
//             Column(
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(image: NetworkImage("https://th.bing.com/th/id/OIP.3HZOOl0lErndPeHwv2Ih3AHaFG?pid=ImgDet&w=207&h=143&c=7&dpr=1.3"),fit: BoxFit.fill,colorFilter:  ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.dstATop),),
//                       // color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF303030):Color(0xFFF9F9F9),
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: Colors.black,width: 0.5)
//                     // boxShadow: <BoxShadow>[
//                     //   BoxShadow(
//                     //     color: Colors.black12,
//                     //     // blurRadius: 1,
//                     //     offset: Oaffset(-.5,2),
//                     //   ),
//                     // ],
//                   ),
//                   margin: EdgeInsets.only(top: 10),
//                   height: 160,
//                   width: 250,
//                   child:  Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           // padding: EdgeInsets.only(left: 5,top:20,right:10),
//                           child: Column(children: <Widget>[
//                             // RawMaterialButton(
//                             //   onPressed: () {},
//                             //   elevation: 0,
//                             //   fillColor: Theme.of(context).brightness == Brightness.dark ? Color(0xFF474747):Color(0xFFE3E3E3),
//                             //   child: Icon(
//                             //     Icons.newspaper,
//                             //     size: 25.0,
//                             //   ),
//                             //   padding: EdgeInsets.all(15.0),
//                             //   shape: CircleBorder(),
//                             // ),
//                             Container(padding: EdgeInsets.only(left: 20), width: double.infinity, child: Text('Insurance',textAlign: TextAlign.left, style: TextStyle(fontSize: 22,fontFamily: "PSM",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)),
//                             Container(padding: EdgeInsets.only(left: 20), width: double.infinity, child: Text('Plans',textAlign: TextAlign.left, style: TextStyle(fontSize: 22,fontFamily: "PSM",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)),
//                             SizedBox(height: 10,),
//                             Container(padding: EdgeInsets.only(left: 20), width: double.infinity, child: Text('25 Plans',textAlign: TextAlign.left, style: TextStyle(fontSize: 15,fontFamily: "PSXL",color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),)),
//
//                           ],),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//       ),
//     );
//   }
// }

// class ForYouCards extends StatefulWidget {
//   const ForYouCards({Key? key}) : super(key: key);
//
//   @override
//   State<ForYouCards> createState() => _ForYouCardsState();
// }
//
// class _ForYouCardsState extends State<ForYouCards> {
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     return  SliverToBoxAdapter(
//       child: Container(
//         margin: EdgeInsets.only(left: 15,right:15),
//         // color: Colors.red,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           // color: Theme.of(context).brightness==Brightness.dark? Color(0xFF303030): Color(0xFFF9F9F9),
//         ),
//         height: screenHeight/2,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             InkWell(
//               child: Container(
//                 height: screenHeight/9,
//                 padding: EdgeInsets.only(left: 15) ,
//                 // color: Colors.amber,
//                 child: Row(
//                   children: <Widget>[
//                     CircleAvatar(
//                       backgroundColor: Theme.of(context).brightness==Brightness.dark? Color(0xFF474747):Color(0xFFE3E3E3),
//                       radius: 40,
//                       child: Icon(Icons.book,size: 30,color: Theme.of(context).brightness==Brightness.dark? Color(0xFFEEEEEE):Color(0xFF343434),),
//                     ),
//                     SizedBox(width: 15,),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Container( width:screenWidth/1.5 , child: Text('Insurance Policies',textAlign: TextAlign.left,style: TextStyle(fontSize: 25,color: Theme.of(context).brightness==Brightness.dark? Color(0xFFEEEEEE):Color(0xFF343434),fontFamily: "PSL"),)),
//                         SizedBox(height: 8,),
//                         Container(width:screenWidth/1.5, child: Text('Enroll in Insurance schemes provided by the government',overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontFamily: "PSXL",fontSize:12 , color: Theme.of(context).brightness==Brightness.dark? Color(0xFFEEEEEE):Color(0xFF343434)),))
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             InkWell(
//               child: Container(
//                 height: screenHeight/9,
//                 padding: EdgeInsets.only(left: 15) ,
//                 // color: Colors.amber,
//                 child: Row(
//                   children: <Widget>[
//                     CircleAvatar(
//                       backgroundColor: Theme.of(context).brightness==Brightness.dark? Color(0xFF474747):Color(0xFFE3E3E3),
//                       radius: 40,
//                       child: Icon(Icons.book,size: 30,color: Theme.of(context).brightness==Brightness.dark? Color(0xFFEEEEEE):Color(0xFF343434),),
//                     ),
//                     SizedBox(width: 15,),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Container( width:screenWidth/1.5 , child: Text('Insurance Policies',textAlign: TextAlign.left,style: TextStyle(fontSize: 25,color: Theme.of(context).brightness==Brightness.dark? Color(0xFFEEEEEE):Color(0xFF343434),fontFamily: "PSL"),)),
//                         SizedBox(height: 8,),
//                         Container(width:screenWidth/1.5, child: Text('Enroll in Insurance schemes provided by the government',overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontFamily: "PSXL",fontSize:12 , color: Theme.of(context).brightness==Brightness.dark? Color(0xFFEEEEEE):Color(0xFF343434)),))
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             InkWell(
//               child: Container(
//                 height: screenHeight/9,
//                 padding: EdgeInsets.only(left: 15) ,
//                 // color: Colors.amber,
//                 child: Row(
//                   children: <Widget>[
//                     CircleAvatar(
//                       backgroundColor: Theme.of(context).brightness==Brightness.dark? Color(0xFF474747):Color(0xFFE3E3E3),
//                       radius: 40,
//                       child: Icon(Icons.book,size: 30,color: Theme.of(context).brightness==Brightness.dark? Color(0xFFEEEEEE):Color(0xFF343434),),
//                     ),
//                     SizedBox(width: 15,),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Container( width:screenWidth/1.5 , child: Text('Insurance Policies',textAlign: TextAlign.left,style: TextStyle(fontSize: 25,color: Theme.of(context).brightness==Brightness.dark? Color(0xFFEEEEEE):Color(0xFF343434),fontFamily: "PSL"),)),
//                         SizedBox(height: 8,),
//                         Container(width:screenWidth/1.5, child: Text('Enroll in Insurance schemes provided by the government',overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontFamily: "PSXL",fontSize:12 , color: Theme.of(context).brightness==Brightness.dark? Color(0xFFEEEEEE):Color(0xFF343434)),))
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ForYouCards extends StatefulWidget {
//   const ForYouCards({Key? key}) : super(key: key);
//
//   @override
//   State<ForYouCards> createState() => _ForYouCardsState();
// }
//
// class _ForYouCardsState extends State<ForYouCards> {
//
//   @override
//   Widget build(BuildContext context) {
//     GeneralizedPadding test = GeneralizedPadding(context);
//     return Container(
//       // color: Colors.red,
//       // padding: EdgeInsets.only(left: 20,right: 50),
//       margin: EdgeInsets.only(left:20,right: 20),
//       height: test.vertical(value: 500),
//       child: GridView.count(
//           crossAxisCount: 2,
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(left: test.horizontal(value: 20),right: test.horizontal(value: 10),bottom: test.vertical(value: 20)),
//             padding: EdgeInsets.all(test.horizontal(value: 20)),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
//             ),
//
//             child: Column(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 23,
//                     child: Text('Insurance',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 20,
//                     child: Text('Policies',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 SizedBox(height: test.vertical(value: 40),),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: 20,
//                     child: Icon(Icons.book),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: test.horizontal(value: 10),right: test.horizontal(value: 20),bottom: test.vertical(value: 20)),
//             padding: EdgeInsets.all(test.horizontal(value: 20)),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
//             ),
//
//             child: Column(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 23,
//                     child: Text('Insurance',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 20,
//                     child: Text('Policies',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 SizedBox(height: test.vertical(value: 40),),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: 20,
//                     child: Icon(Icons.book),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: test.horizontal(value: 20),right: test.horizontal(value: 10),bottom: test.vertical(value: 20)),
//             padding: EdgeInsets.all(test.horizontal(value: 20)),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
//             ),
//
//             child: Column(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 23,
//                     child: Text('Insurance',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 20,
//                     child: Text('Policies',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 SizedBox(height: test.vertical(value: 40),),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: 20,
//                     child: Icon(Icons.book),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: test.horizontal(value: 10),right: test.horizontal(value: 20),bottom: test.vertical(value: 20)),
//             padding: EdgeInsets.all(test.horizontal(value: 20)),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
//             ),
//
//             child: Column(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 23,
//                     child: Text('Insurance',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 20,
//                     child: Text('Policies',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 SizedBox(height: test.vertical(value: 40),),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: 20,
//                     child: Icon(Icons.book),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: test.horizontal(value: 20),right: test.horizontal(value: 10),bottom: test.vertical(value: 20)),
//             padding: EdgeInsets.all(test.horizontal(value: 20)),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
//             ),
//
//             child: Column(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 23,
//                     child: Text('Insurance',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 20,
//                     child: Text('Policies',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 SizedBox(height: test.vertical(value: 40),),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: 20,
//                     child: Icon(Icons.book),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: test.horizontal(value: 10),right: test.horizontal(value: 20),bottom: test.vertical(value: 20)),
//             padding: EdgeInsets.all(test.horizontal(value: 20)),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
//             ),
//
//             child: Column(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 23,
//                     child: Text('Insurance',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 20,
//                     child: Text('Policies',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
//                   ),
//                 ),
//                 SizedBox(height: test.vertical(value: 40),),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: 20,
//                     child: Icon(Icons.book),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//
//
//
//         ],
//       ),
//     );
//   }
// }

class ForYouCards extends StatefulWidget {
  const ForYouCards({Key? key}) : super(key: key);

  @override
  State<ForYouCards> createState() => _ForYouCardsState();
}

class _ForYouCardsState extends State<ForYouCards> {
  @override
  Widget build(BuildContext context) {
    GeneralizedPadding test = GeneralizedPadding(context);
    double screenWidth=MediaQuery.of(context).size.width;
    return Container(
      // padding: EdgeInsets.all(0),
      // color: Colors.red,
      height: test.vertical(value: 615),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                splashColor: Colors.blue,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InsurancePg()));
                },
                child: Container(
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.3,
                  // height: 186,
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 23),
                          child: Text('Insurance',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 23),
                          child: Text('Policies',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: test.vertical(value: 80),),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 20,
                          child: Icon(Icons.book,color: Color(0xFF207E81),),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              // SizedBox(width: 10,),
              Container(
                width: screenWidth/2.3,
                // height: 180,
                // width: screenWidth/2,
                // margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(test.horizontal(value: 20)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                ),

                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: test.vertical(value: 23),
                        child: Text('Link With',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 20,
                        child: Text('Blood Banks',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                      ),
                    ),
                    SizedBox(height: test.vertical(value: 80),),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: test.vertical(value: 23),
                        child: Icon(Icons.water_drop,color: Color(0xFFFF6161),),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                splashColor: Colors.blue,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InsurancePg()));
                },
                child: Container(
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.3,
                  // height: 186,
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 23),
                          child: Text('Pharmacies',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 23),
                          child: Text('',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: test.vertical(value: 80),),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 20,
                          child: Icon(Icons.shopping_bag_outlined,color: Theme.of(context).brightness == Brightness.dark? Color(
                              0xFFB4FF93):Color(0xFF327A1E),),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              // SizedBox(width: 10,),
              Container(
                width: screenWidth/2.3,
                // height: 180,
                // width: screenWidth/2,
                // margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(test.horizontal(value: 20)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                ),

                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: test.vertical(value: 23),
                        child: Text('Nearby',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 20,
                        child: Text('',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                      ),
                    ),
                    SizedBox(height: test.vertical(value: 80),),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: test.vertical(value: 23),
                        child: Icon(Icons.location_on,color: Color(0xFF88602E),),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                splashColor: Colors.blue,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InsurancePg()));
                },
                child: Container(
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.3,
                  // height: 186,
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 23),
                          child: Text('Orders',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 23),
                          child: Text('',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: test.vertical(value: 80),),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 20,
                          child: Icon(Icons.shopping_cart,color: Theme.of(context).brightness == Brightness.dark? Color(
                              0xFFB4FF93):Color(0xFF327A1E),),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              // SizedBox(width: 10,),
              Container(
                width: screenWidth/2.3,
                // height: 180,
                // width: screenWidth/2,
                // margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(test.horizontal(value: 20)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                ),

                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: test.vertical(value: 23),
                        child: Text('My',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 23,
                        child: Text('Appointments',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                      ),
                    ),
                    SizedBox(height: test.vertical(value: 80),),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: test.vertical(value: 23),
                        child: Icon(Icons.sticky_note_2_sharp,color: Color(0xFF1B5B81),),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),

          // SizedBox(height: test.vertical(value: 15),),

          // SizedBox(height: test.vertical(value: 15),),





        ],
      ),
    );
  }
}


