import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/services.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/theme_constants.dart';
import 'HealthData.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

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
      debugShowCheckedModeBanner: false,
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
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Theme.of(context).scaffoldBackgroundColor,
                statusBarIconBrightness:
                    Theme.of(context).brightness == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).brightness == Brightness.dark
                    ? LBoxFill
                    : DBoxFill,
              ),
            ),
            title: Text('Health',
                style: TextStyle(
                    fontFamily: "PSL",
                    fontSize: 22,
                    letterSpacing: 0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? LBoxFill
                        : DBoxFill)),
          ),
          AboveChart(),
          SliverToBoxAdapter(
            child: HealthChart(
              data: data,
            ),
          ),
          TipsBox(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          BloodPressureBox(),

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
                height: 250,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Color(0xFF131313)
                    : Color(0xFFF2F2F2),
                child: new charts.BarChart(
                  series,
                  animate: true,
                  defaultRenderer: new charts.BarRendererConfig(
                      maxBarWidthPx: 200,
                      cornerStrategy: charts.ConstCornerStrategy(6)),
                ),
              ) //TODO:THIS IS CONTAINTER FOR CHART
            ],
          ),
        ),
      ),
    );
  }
}

class AboveChart extends StatefulWidget {
  AboveChart({Key? key}) : super(key: key);


  @override
  State<AboveChart> createState() => _AboveChartState();
}
bool checkif (context){
  if(Theme.of(context).brightness==Brightness.dark){
    return true;
  }
  else return false;
}
class _AboveChartState extends State<AboveChart> {
  @override
  void textColor(){
    if(checkif(context)){
      Color TSelected= DBoxFill;
      Color TunSelected = LBoxFill;
    }
    else {
      Color TSelected=LBoxFill;
      Color TunSelected=DBoxFill;
    }
  }
  Color TSelected = Colors.red;
  Color TunSelected = Colors.red;
  Widget build(BuildContext context) {

    GeneralizedPadding test = GeneralizedPadding(context);
    textColor();
    return SliverToBoxAdapter(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: test.vertical(value: 50),
            width: test.horizontal(value: 130),
            child: Container(
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).brightness == Brightness.dark
                    ? Color(0xFF95C9C3)
                    : Color(0xFF10938E),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Heart",
                      style: TextStyle(
                          fontFamily: "PSL",
                          color: Theme.of(context).brightness == Brightness.dark
                              ? DBoxFill
                              : LBoxFill),
                    ),
                  ),
                  Icon(Icons.arrow_drop_down,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? DBoxFill
                          : LBoxFill),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: test.vertical(value: 10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: test.horizontal(value: 20)),
                child: Text(
                  'Health Stats',
                  style: TextStyle(
                      fontSize: 16, fontFamily: "PSM", letterSpacing: 1),
                ),
              ),
            ),
              SizedBox(
                height: test.vertical(value: 60),
                child: Container(
                  margin: EdgeInsets.only(right: test.horizontal(value: 20)),
                  height: test.vertical(value: 60),
                  width:test.horizontal(value: 220) ,
                  decoration: BoxDecoration(
                    color:Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(7),
                    width: test.horizontal(value: 200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: test.vertical(value: 50),
                          width: test.horizontal(value: 100),
                          alignment: Alignment.center,
// padding: EdgeInsets.all(19),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:Theme.of(context).brightness==Brightness.dark? Color(
                                0xFF95C9C3):Color(
                                0xFF10938E),
                          ),
                          child: Text(
                            'Peak',
                            style: TextStyle(
                                fontFamily: "PSL",
                                fontSize: 16,
                                color:Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: test.vertical(value: 50),
                          width: test.horizontal(value: 100),
// padding: EdgeInsets.all(20),
                          child: Text(
                            'Avg',
                            style: TextStyle(
                                fontFamily: "PSL",
                                fontSize: 16,
                                color:Theme.of(context).brightness==Brightness.dark? LBoxFill:DBoxFill
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
//             Container(
//               color: Colors.red,
//               width: 200,
//               alignment: Alignment.center,
//               // color: Colors.red,
//               margin: EdgeInsets.only(right: 20),
//               child: CustomSlidingSegmentedControl<int>(
//                 fromMax: true,
//                 innerPadding: EdgeInsets.all(5),
//                 children:  {
//                   1: Text(
//                     'Peak',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: TSelected),
//                   ),
//                   2: Text(
//                     'Avg',
//                     textAlign: TextAlign.center,
//                   ),
//                 },
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 thumbDecoration: BoxDecoration(
//                   color:Theme.of(context).brightness==Brightness.dark? Color(
//                       0xFF95C9C3):Color(
//                       0xFF10938E),
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//
//                 onValueChanged: (int value) {
//                   if(value==1){
//                     Future.delayed(
//                       Duration(milliseconds: 10)).then((TSelected){
//                         setState(() {
//                           TSelected=Theme.of(context).scaffoldBackgroundColor;
//                         });
//                     }
//                     );
//                 }
//                   else{
//                     Future.delayed(
//                         Duration(milliseconds: 1000)).then((value){
//                       setState(() {
//                         TSelected=Theme.of(context).scaffoldBackgroundColor;
//                       });
//                     });
//                   }
//                   ;}
//               ),
//             )
          ],
        ),
      ],
    ));
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
        height: test.vertical(value: 200),
        margin: EdgeInsets.only(
            left: test.horizontal(value: 20),
            right: test.horizontal(value: 20)),
        padding: EdgeInsets.only(
            left: test.horizontal(value: 20),
            bottom: test.vertical(value: 10),
            top: 5,
            right: test.horizontal(value: 20)),
        // width: test.horizontal(value: ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).brightness == Brightness.dark
              ? DBoxFill
              : LBoxFill,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // SizedBox(height: 5,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'How to Increase Lung Capacity?',
                style: TextStyle(fontFamily: "PSL", fontSize: 22),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('1. Practice cardio exercises',
                  style: TextStyle(fontFamily: "PSXL", fontSize: 15)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('2. Diaphragmatic breathing and other types of breathing exercises',
                  style: TextStyle(fontFamily: "PSXL", fontSize: 15)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('3. Try playing wind instruments like woodwind or brass instruments',
                  style: TextStyle(fontFamily: "PSXL", fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}

class BloodPressureBox extends StatefulWidget {
  const BloodPressureBox({Key? key}) : super(key: key);

  @override
  State<BloodPressureBox> createState() => _BloodPressureBoxState();
}

class _BloodPressureBoxState extends State<BloodPressureBox> {
  @override
  Widget build(BuildContext context) {
    GeneralizedPadding test = GeneralizedPadding(context);
    return SliverToBoxAdapter(
      child: Container(
        height: test.vertical(value: 200),
        margin: EdgeInsets.only(
            left: test.horizontal(value: 20),
            right: test.horizontal(value: 20)),
        padding: EdgeInsets.only(
            left: test.horizontal(value: 20),
            bottom: test.vertical(value: 10),
            top: 5,
            right: test.horizontal(value: 20)),
        // width: test.horizontal(value: ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).brightness == Brightness.dark
              ? DBoxFill
              : LBoxFill,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // SizedBox(height: 5,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'How to reduce blood pressure?',
                style: TextStyle(fontFamily: "PSL", fontSize: 22),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('1. Try mind-body exercises like yoga and tai chi ',
                  style: TextStyle(fontFamily: "PSXL", fontSize: 15)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('2. Listen to calming music, or make music.',
                  style: TextStyle(fontFamily: "PSXL", fontSize: 15)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('3. Increase activity and exercise more',
                  style: TextStyle(fontFamily: "PSXL", fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}


