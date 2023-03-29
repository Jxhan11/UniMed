import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/main.dart';

class NewsInfo{
  final Text heading;
  final Text info;
  final Text source;

  NewsInfo({required this.heading,required this.info,required this.source});
}

List<NewsInfo>data=[
  NewsInfo(
      heading: Text('Health minister follows up presidential directives to improve healthcare services offered to citizens'),
      info: Text('Minister of Health and Population Khaled Abdel Ghaffar asserted that work will be intensified in all sectors affiliated with'),
      source: Text('Times Of India')),
  NewsInfo(
      heading: Text('Health minister follows up presidential directives to improve healthcare services offered to citizens'),
      info: Text('Minister of Health and Population Khaled Abdel Ghaffar asserted that work will be intensified in all sectors affiliated with'),
      source: Text('Times Of India')),
  NewsInfo(
      heading: Text('Health minister follows up presidential directives to improve healthcare services offered to citizens'),
      info: Text('Minister of Health and Population Khaled Abdel Ghaffar asserted that work will be intensified in all sectors affiliated with'),
      source: Text('Times Of India')),
  NewsInfo(
      heading: Text('Health minister follows up presidential directives to improve healthcare services offered to citizens'),
      info: Text('Minister of Health and Population Khaled Abdel Ghaffar asserted that work will be intensified in all sectors affiliated with'),
      source: Text('Times Of India')),
  NewsInfo(
      heading: Text('Health minister follows up presidential directives to improve healthcare services offered to citizens'),
      info: Text('Minister of Health and Population Khaled Abdel Ghaffar asserted that work will be intensified in all sectors affiliated with'),
      source: Text('Times Of India')),
  NewsInfo(
      heading: Text('Health minister follows up presidential directives to improve healthcare services offered to citizens'),
      info: Text('Minister of Health and Population Khaled Abdel Ghaffar asserted that work will be intensified in all sectors affiliated with'),
      source: Text('Times Of India')),
  NewsInfo(
      heading: Text('Health minister follows up presidential directives to improve healthcare services offered to citizens'),
      info: Text('Minister of Health and Population Khaled Abdel Ghaffar asserted that work will be intensified in all sectors affiliated with'),
      source: Text('Times Of India')),
  NewsInfo(
      heading: Text('Health minister follows up presidential directives to improve healthcare services offered to citizens'),
      info: Text('Minister of Health and Population Khaled Abdel Ghaffar asserted that work will be intensified in all sectors affiliated with'),
      source: Text('Times Of India')),
];

class NewNewsPage extends StatefulWidget {
  const NewNewsPage({Key? key}) : super(key: key);

  @override
  State<NewNewsPage> createState() => _NewNewsPageState();
}

class _NewNewsPageState extends State<NewNewsPage> with TickerProviderStateMixin{
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _onAnimationEnd(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.stop();
    }
  }
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
                Text('News',
                    style: TextStyle(
                        fontFamily: "PSL", fontSize: 22, letterSpacing: 0,color: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill)),

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    GeneralizedPadding test = GeneralizedPadding(context);
    return  Container(
      height: screenHeight*2,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: data.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height:test.vertical(value: 200),
              margin: EdgeInsets.symmetric(vertical: test.vertical(value: 5),horizontal: test.horizontal(value: 20) ),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness ==Brightness.dark? DBoxFill : LBoxFill,
                borderRadius: BorderRadius.circular(5),
                // border: Border.all(color: Theme.of(context).brightness ==Brightness.dark? LBoxFill : DBoxFill,width: 0.5)
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    // color: Colors.red,
                    width: test.vertical(value: 220),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.topLeft,
                          child: Text(data[index].heading!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: test.horizontal(value: 20),right: test.horizontal(value: 20),bottom: test.vertical(value: 20)),
                          alignment: Alignment.centerLeft,
                          child: Text(data[index].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: test.horizontal(value: 20),right: test.horizontal(value: 20),bottom: test.vertical(value: 20)),
                          alignment: Alignment.bottomLeft,
                          child: Text(data[index].source!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        ),
                      ],
                    ),
                  ),
                  Container(

                    // color: Colors.red,
                    // margin: EdgeInsets.all(10),
                    width: test.horizontal(value: 150),
                      // height: test.vertical(value: 180),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset('images/img.png',fit: BoxFit.cover)),
                  ),
                ],
              )

            );
          }
      ),
    );
  }
}
