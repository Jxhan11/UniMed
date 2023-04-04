import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/main.dart';

class NewsInfo{
  final Text heading;
  final Text info;
  final Text source;
  final String url;

  NewsInfo({required this.heading,required this.info,required this.source,required this.url});
}

List<NewsInfo>data=[
  NewsInfo(
      heading: Text('Single-day rise of 2,151 fresh COVID-19 cases in India; highest in 5 months'),
      info: Text('India recorded a single-day rise of 2,151 new coronavirus cases, the highest in five months, while the active cases increased ...'),
      source: Text('The Pioneer'),
    url: 'https://www.dailypioneer.com/uploads/2023/story/images/big/single-day-rise-of-2-151-fresh-covid-19-cases-in-india--highest-in-5-months-2023-03-29.jpg'
  ),
  NewsInfo(
      heading: Text('Guidelines,Instructions for issuance of statement of need certificate for medical doctors going abroad including USA for pursuing higher studies'),
      info: Text('Events and Guidelines'),
      source: Text('The Ministry of Health'),
      url: 'https://www.indiapost.com/wp-content/uploads/2018/01/ministry-of-health.jpg'
  ),
  NewsInfo(
      heading: Text('Health Ministry action sends strong signal on good manufacturing practices: Drugmakers'),
      info: Text('The cancellation of licences of 18 drug companies for the manufacture of spurious drugs, has sent out a strong signal on the adherence to good manufacturing practices (GMP), say drug-makers, on recent action taken by the Health Ministry.'),
      source: Text('The Hindustan Times'),
      url: 'https://bl-i.thgim.com/public/incoming/km8v3a/article66676581.ece/alternates/LANDSCAPE_1200/hy12Drugs.jpg'
  ),
  NewsInfo(
      heading: Text('5 states contributing maximum number of cases to India’s tally'),
      info: Text('India recorded a single-day rise of 2,151 new coronavirus cases, the highest in five months, while the active cases increased to 11,903, according to the Union health ministry data updated on Wednesday. The Covid-19 death toll has increased to 5,30,848 with seven latest fatalities in the last 24 hours-- three reported by Maharashtra, one by Karnataka and three reconciled by Kerala.'),
      source: Text('businessline'),
      url: 'https://www.indiapost.com/wp-content/uploads/2018/01/ministry-of-health.jpg'
  ),
  NewsInfo(
      heading: Text('Health ministry approaches CERT-In over attempt to hack its website'),
      info: Text("According to a report by CloudSEK, the group mentioned that the attack is 'a consequence of India's agreement over the oil price cap and sanctions of G20 over the Russia-Ukraine war'"),
      source: Text('The Indian Express'),
      url: 'https://images.newindianexpress.com/uploads/user/imagelibrary/2022/5/19/w900X450/hacking_pexels.jpg?w=640&dpr=1.3'
  ),
  NewsInfo(
      heading: Text('Single-day rise of 2,151 fresh COVID-19 cases in India; highest in 5 months'),
      info: Text('India recorded a single-day rise of 2,151 new coronavirus cases, the highest in five months, while the active cases increased ...'),
      source: Text('The Pioneer'),
      url: 'https://www.dailypioneer.com/uploads/2023/story/images/big/single-day-rise-of-2-151-fresh-covid-19-cases-in-india--highest-in-5-months-2023-03-29.jpg'
  ),

];

class NewNewsPage extends StatefulWidget {
  const NewNewsPage({Key? key}) : super(key: key);

  @override
  State<NewNewsPage> createState() => _NewNewsPageState();
}

class _NewNewsPageState extends State<NewNewsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      body:CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:Theme.of(context).scaffoldBackgroundColor,
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
            title: Row(
              children: <Widget>[
                // SizedBox(width: 10,),
                Text('News',
                    style: TextStyle(
                        fontFamily: "PSL", fontSize: 22, letterSpacing: 0,color: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill)),
                Container(
                  // alignment: Alignment.center,
                  // color: Colors.red,
                  // padding: EdgeInsets.only(right: 40),
                  width:50,
                  height: 50,
                  child: Lottie.asset(
                      Theme.of(context).brightness==Brightness.dark?'Animations/Newspaper animation.json':'Animations/353-newspaper-spinner.json',
                      repeat: false,
                      fit: BoxFit.fitHeight
                  ),
                ),



              ],
            )
          ),

          SliverToBoxAdapter(
            child: NewsList(
              data: data,
            ),
          ),

        ],
      ),
    );
  }
}


class NewsList extends StatefulWidget {
  const NewsList({Key? key,required this.data}) : super(key: key);
 final List<NewsInfo>data;
  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    double stbar = MediaQuery.of(context).viewPadding.top;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    GeneralizedPadding test = GeneralizedPadding(context);
    return  Container(
      height: screenHeight/1.13,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: data.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height:test.vertical(value: 200),
              margin: EdgeInsets.symmetric(vertical: test.vertical(value: 8),horizontal: test.horizontal(value: 20) ),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness ==Brightness.dark? DBoxFill : LBoxFill,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: Theme.of(context).brightness ==Brightness.dark? LBoxFill : DBoxFill,width: 0.5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    // color: Colors.red,
                    // height: test.vertical(value: 220),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.topLeft,
                          child: Text(data[index].heading!.data!,style: TextStyle(fontFamily: "PSL",fontSize: 20),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: test.horizontal(value: 20),right: test.horizontal(value: 20),bottom: test.vertical(value: 20)),
                          alignment: Alignment.centerLeft,
                          child: Text(data[index].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        ),
                        Expanded(child:SizedBox(height: 1,) ),
                        Container(
                          padding: EdgeInsets.only(left: test.horizontal(value: 20),right: test.horizontal(value: 20),bottom: test.vertical(value: 20)),
                          alignment: Alignment.bottomLeft,
                          child: Text(data[index].source!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 15),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                        // color: Colors.red,
                        padding: EdgeInsets.all(10),
                        width: 350,
                        height: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.network(data[index].url,fit: BoxFit.cover)),
                      ),
                  ),
                ],
              )

            );
          }
      ),
    );
  }
}
