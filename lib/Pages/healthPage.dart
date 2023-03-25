import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/services.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/Pages/searchWithSuggestions.dart';
import 'package:unimed/main.dart';
import 'package:unimed/theme_constants.dart';
import 'searchResultsPage.dart';
import 'HealthData.dart';

class SubscriberSeries {
  final String year;
  final int subscribers;
  final charts.Color barColor;

  SubscriberSeries(
      {required this.year, required this.subscribers, required this.barColor});
}

class HealthPageWidgets extends StatefulWidget {
  const HealthPageWidgets({Key? key}) : super(key: key);

  @override
  State<HealthPageWidgets> createState() => _HealthPageWidgetsState();
}

class _HealthPageWidgetsState extends State<HealthPageWidgets> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Page',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.),
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
        fontFamily: "ProductSans",
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
      home: HealthPg(),
    );
  }
}

class HealthPg extends StatefulWidget {
  HealthPg({Key? key}) : super(key: key);

  @override
  State<HealthPg> createState() => _HealthPgState();
}

class _HealthPgState extends State<HealthPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(),
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
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Color(0xFFFF8E8E)
                                : Colors.red,
                        radius: 18,
                        child: Icon(
                          Icons.person_rounded,
                        ),
                      ),
                    ),
                    // SizedBox(width: 1,),
                  ],
                ),
              ),
            ),
          ),
          AboveChart(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
          SubHeadlines(text: "Health Stats"),
          SliverToBoxAdapter(
            child: HealthChart(
              data: data,
            ),
          ),
          TipsBox(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          TipsBox(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class HealthChart extends StatelessWidget {
  HealthChart({Key? key, required this.data}) : super(key: key);
  final List<SubscriberSeries> data;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: "BPM",
          data: data,
          domainFn: (SubscriberSeries series, _) => series.year,
          measureFn: (SubscriberSeries series, _) => series.subscribers,
          colorFn: (SubscriberSeries series, _) => series.barColor)
    ];
    return Container(
      // height: 470,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 400,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Color(0xFF131313)
                    : Color(0xFFF2F2F2),
                child: new charts.BarChart(series, animate: true),
              ) //TODO:THIS IS CONTAINTER FOR CHART
            ],
          ),
        ),
      ),
    );
  }
}

class AboveChart extends StatefulWidget {
  const AboveChart({Key? key}) : super(key: key);

  @override
  State<AboveChart> createState() => _AboveChartState();
}

class _AboveChartState extends State<AboveChart> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 20),
        // color: Colors.red,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 50,
                width: 140,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Color(0xFF8D9EFC)
                      : Color(0xFF8D9EFC),
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                    child: Text(
                  'Heart',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xFF303030)
                        : Color(0xFFFFFFFF),
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TipsBox extends StatefulWidget {
  const TipsBox({Key? key}) : super(key: key);

  @override
  State<TipsBox> createState() => _TipsBoxState();
}

class _TipsBoxState extends State<TipsBox> {
  @override
  Widget build(BuildContext context) {
    GeneralizedPadding test = GeneralizedPadding(context);
    return SliverToBoxAdapter(
      child: Container(
        height: test.vertical(value:200),
        margin: EdgeInsets.only(left: test.horizontal(value: 20),right: test.horizontal(value: 20)),
        padding: EdgeInsets.only(left: test.horizontal(value: 20),bottom: test.vertical(value: 10),top: 5),
        // width: test.horizontal(value: ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // SizedBox(height: 5,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('How to Increase Lung Capacity?',style: TextStyle(fontFamily: "PSL",fontSize: 22),),
            ),
            SizedBox(height: 1,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('1. Hold Breath for over a minute everyday',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('2. Eat grapes',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('3. Swimming',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
            ),

          ],
        ),
      ),
    );
  }
}
