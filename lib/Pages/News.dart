import 'package:flutter/material.dart';
import 'package:unimed/main.dart';

import '../theme_constants.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);


  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'News Page',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
      home:  News(),
    );
  }
}

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              children: <Widget>[
                // SizedBox(width: 20,),
                IconButton(onPressed: (){
                  Navigator.pop(context);},
                 icon: Icon(Icons.arrow_back,color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),
                ),
                SizedBox(width: 20,),
                Text("Headlines",style: TextStyle(fontFamily: "PSL",fontSize: 25,letterSpacing: 1,color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),),),

              ],
            ),
          ),
          
          //END OF APP BAR
          SliverToBoxAdapter(child: SizedBox(height: 20,),),
          NewsCards(title: 'Now Health Ministry Says: ‘No Report’ On The Creation Of Health Database By E-Pharmacies', info: 'If the government is considering banning e-pharmacies over ‘misuse of data’ among other issues, what explains this response?'),
          SliverToBoxAdapter(child: SizedBox(height: 20,),),
          NewsCards(title: 'Now Health Ministry Says: ‘No Report’ On The Creation Of Health Database By E-Pharmacies', info: 'If the government is considering banning e-pharmacies over ‘misuse of data’ among other issues, what explains this response?'),
          SliverToBoxAdapter(child: SizedBox(height: 20,),),
          NewsCards(title: 'Now Health Ministry Says: ‘No Report’ On The Creation Of Health Database By E-Pharmacies', info: 'If the government is considering banning e-pharmacies over ‘misuse of data’ among other issues, what explains this response?'),
          SliverToBoxAdapter(child: SizedBox(height: 20,),),




        ],
      ),
    ) ;
  }
}

class NewsCards extends StatelessWidget {
  const NewsCards({Key? key, required this.title,required this.info}) : super(key: key);
final String title;
final String info;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: screenWidth/19,right: screenWidth/19),
        decoration: BoxDecoration(
          color: Color(0xFF303030),
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(width: 0.5,color: Colors.grey)
        ),
        // height: screenHeight/3,
        padding: EdgeInsets.all(5),
        // width: screenWidth/4
        height: screenHeight/2.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                height: screenHeight/4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image:DecorationImage(image: NetworkImage('https://www.bing.com/th?id=OVFT.fbHu959njXCITbTwvm71Ry&pid=News&w=300&h=186&c=14&rs=2&qlt=90&dpr=1.3',),fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(15),

                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(20), child: Text(title,style: TextStyle(color: Colors.white,fontSize: 20),)),
            Padding(padding: EdgeInsets.only(left:20,right: 20,bottom: 10), child: Text(info,style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: "PSXL"),)),

          ],
        ),
      ),
    );
  }
}
