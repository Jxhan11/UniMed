import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:lottie/lottie.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    GeneralizedPadding test = GeneralizedPadding(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
            title: Text('Emergency',
                style: TextStyle(
                    fontFamily: "PSL", fontSize: 22, letterSpacing: 0,color: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill)),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20,),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: test.vertical(value: 300),
                width: double.infinity,
                // padding: EdgeInsets.all(20),
                // margin: EdgeInsets.only(right: test.horizontal(value: 305),left: test.vertical(value: 20)),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(100),
                  // color: Colors.red
                  // color: Theme.of(context).brightness == Brightness.dark? DIconBg:Color(0xFFF9F9F9),

                ),
                child: Center(
                  child: Lottie.asset(
                      Theme.of(context).brightness==Brightness.dark? 'Animations/Dsheild.json':'Animations/Lsheild.json',
                      repeat: true,
                      reverse: true,
                      // height: test.vertical(value: 200),
                    width: test.horizontal(value: 300),

                  ),
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: SizedBox(height: 100,),
          // ),
          SliverToBoxAdapter(
            child: EmergencyNos(),
          ),

        ],
      ),
    );
  }
}

class EmergencyNos extends StatefulWidget {
  const EmergencyNos({Key? key}) : super(key: key);

  @override
  State<EmergencyNos> createState() => _EmergencyNosState();
}

class _EmergencyNosState extends State<EmergencyNos> {
  @override
  Widget build(BuildContext context) {
    GeneralizedPadding test = GeneralizedPadding(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: (){
                },
                child: Container(
                  height: test.vertical(value: 180),
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
                          // height: test.vertical(value: 23),
                          child: Text('National Emergency Number',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                      ),
                      Expanded(child: SizedBox(height: 1,)),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).brightness==Brightness.dark? Color(0xFFFFA1A1):Color(0xFFA00000),
                          ),
                          child: Center(
                            child: Text('Dial 112',style: TextStyle(fontFamily: "PSM",fontSize: 15,color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,),),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              // SizedBox(width: 10,),
              InkWell(
                splashColor: Colors.blue,
                onTap: (){
                },
                child: Container(
                  height: test.vertical(value: 180),
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
                          // height: test.vertical(value: 23),
                          child: Text('Police',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                      ),
                      Expanded(child: SizedBox(height: 1,)),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).brightness==Brightness.dark? Color(0xFFFFA1A1):Color(0xFFA00000),
                          ),
                          child: Center(
                            child: Text('Dial 100',style: TextStyle(fontFamily: "PSM",fontSize: 15,color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,),),
                          ),
                        ),
                      ),


                    ],
                  ),
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
                },
                child: Container(
                  height: test.vertical(value: 180),
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
                          // height: test.vertical(value: 23),
                          child: Text('Fire',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                      ),
                      Expanded(child: SizedBox(height: 1,)),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).brightness==Brightness.dark? Color(0xFFFFA1A1):Color(0xFFA00000),
                          ),
                          child: Center(
                            child: Text('Dial 101',style: TextStyle(fontFamily: "PSM",fontSize: 15,color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,),),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              // SizedBox(width: 10,),
              InkWell(
                splashColor: Colors.blue,
                onTap: (){
                },
                child: Container(
                  height: test.vertical(value: 180),
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
                          // height: test.vertical(value: 23),
                          child: Text('Ambulance',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                      ),
                      Expanded(child: SizedBox(height: 1,)),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).brightness==Brightness.dark? Color(0xFFFFA1A1):Color(0xFFA00000),
                          ),
                          child: Center(
                            child: Text('Dial 102',style: TextStyle(fontFamily: "PSM",fontSize: 15,color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,),),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
