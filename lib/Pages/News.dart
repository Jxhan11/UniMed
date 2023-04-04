import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/main.dart';

import '../theme_constants.dart';

// class NewsPage extends StatefulWidget {
//   const NewsPage({Key? key}) : super(key: key);
//
//
//   @override
//   State<NewsPage> createState() => _NewsPageState();
// }
//
// class _NewsPageState extends State<NewsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       title: 'News Page',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         // appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.),
//         scaffoldBackgroundColor: Color(0xFFF2F2F2),
//         fontFamily: "ProductSans",
//         textTheme: TextTheme(
//           // bodyLarge:
//           //     TextStyle(fontFamily: "PSB",),
//           // bodyMedium:
//           //     TextStyle(fontFamily: "PSM",),
//           // bodySmall:
//           //     TextStyle(fontFamily: "PSL",),
//           headline1:
//           TextStyle(color: Colors.deepPurpleAccent, fontFamily: "PSM"),
//           headline2:
//           TextStyle(color: Colors.deepPurpleAccent, fontFamily: "PSM"),
//           bodyText2: TextStyle(fontFamily: "PSM"),
//           // bodyText1: TextStyle(color: Colors.blue),
//           subtitle1: TextStyle(fontFamily: "PSM"),
//         ),
//       ),
//       darkTheme: AppTheme().darkTheme,
//       // Inner UI of the application
//       themeMode: ThemeMode.system,
//       home:  News(),
//     );
//   }
// }

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
            title: Text('News',
                style: TextStyle(
                    fontFamily: "PSL", fontSize: 22, letterSpacing: 0)),
          ),
          
          //END OF APP BAR
          SliverToBoxAdapter(child: SizedBox(height: 20,),),
          NewsCards(title: 'Now Health Ministry Says: ‘No Report’ On The Creation Of Health Database By E-Pharmacies', info: 'Times of India'),
          SliverToBoxAdapter(child: SizedBox(height: 20,),),
          NewsCards(title: 'Now Health Ministry Says: ‘No Report’ On The Creation Of Health Database By E-Pharmacies', info: 'Times of India'),
          SliverToBoxAdapter(child: SizedBox(height: 20,),),
          NewsCards(title: 'Now Health Ministry Says: ‘No Report’ On The Creation Of Health Database By E-Pharmacies', info: 'Times of India'),
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
            border: Border.all(color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),width: 0.3),
            color: Theme.of(context).brightness == Brightness.dark? Color(0xFF303030):LBoxFill,
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(width: 0.5,color: Colors.grey)
        ),
        // height: screenHeight/3,
        // padding: EdgeInsets.all(5),
        // width: screenWidth/4
        height: screenHeight/2.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                // margin: EdgeInsets.only(top:20),
                height: screenHeight/4,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  // border: Border.all(color: Colors.black,width: 2),
                  image:DecorationImage(image: NetworkImage('https://www.bing.com/th?id=OVFT.fbHu959njXCITbTwvm71Ry&pid=News&w=300&h=186&c=14&rs=2&qlt=90&dpr=1.3',),fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),

                ),
              ),
            ),
            Container(padding: EdgeInsets.only(left: 20,right: 10), width: double.infinity,height: 100, margin: EdgeInsets.only(top: 20), child: Text(title,style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),fontSize: 20,fontFamily: "PSL"),)),
            Container(padding: EdgeInsets.only(left: 20), width: double.infinity,height: 20,child: Text(info,maxLines: 2, style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFEEEEEE):Color(0xFF363636),fontSize: 15,fontFamily: "PSM",overflow: TextOverflow.ellipsis,),)),

          ],
        ),
      ),
    );
  }
}
