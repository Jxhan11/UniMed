import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimed/Components/usefulStuff.dart';

import '../theme_constants.dart';

class InsuranceSeries {
  final Text? rating;
  final Text? insuranceName;
  final Text? info;
  final Text? price;
   InsuranceSeries(
  {required this.rating, required this.insuranceName,required this.info, required this.price}
       );
}
int count = 0;

final List<InsuranceSeries>data = [
  InsuranceSeries(
    rating: Text('5') ,
    insuranceName:Text('Insurance Plan 1',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('Only If u are earning less than 10k a month',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('2k/month',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
  ),
  InsuranceSeries(
    rating: Text('4') ,
    insuranceName:Text('Insurance Plan 2',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('Only If u are earning less than 10k a month',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('2k/month',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
  ),
  InsuranceSeries(
    rating: Text('3') ,
    insuranceName:Text('Insurance Plan 3',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('Only If u are earning less than 10k a month',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('2k/month',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
  ),
  InsuranceSeries(
    rating: Text('1') ,
    insuranceName:Text('Insurance Plan 4',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('Only If u are earning less than 10k a month',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('2k/month',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
  ),
  InsuranceSeries(
    rating: Text('5') ,
    insuranceName:Text('Insurance Plan 5',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('Only If u are earning less than 10k a month',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('2k/month',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
  ),
  InsuranceSeries(
    rating: Text('2') ,
    insuranceName:Text('Insurance Plan 6',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('Only If u are earning less than 10k a month',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('2k/month',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
  ),
];

class InsurancePg extends StatefulWidget {
  const InsurancePg({Key? key}) : super(key: key);

  @override
  State<InsurancePg> createState() => _InsurancePgState();
}

class _InsurancePgState extends State<InsurancePg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Theme.of(context).scaffoldBackgroundColor,statusBarIconBrightness: Theme.of(context).brightness==Brightness.dark? Brightness.light:Brightness.dark),
            leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: Theme.of(context).brightness==Brightness.dark? LBoxFill:DBoxFill,),
            ),
            title: Text('Insurance Schemes',style: TextStyle(fontFamily: "PSL",fontSize: 22,letterSpacing: 0)),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20,),),
          SliverToBoxAdapter(
            child: InsuranceCards(
              data: data,
            ),
          ),


        ],
      ),
    );
  }
}


class InsuranceCards extends StatefulWidget {
  const InsuranceCards({Key? key, required this.data}) : super(key: key);
final List<InsuranceSeries>data;

  @override
  State<InsuranceCards> createState() => _InsuranceCardsState();
}

class _InsuranceCardsState extends State<InsuranceCards> {
  @override
  Widget build(BuildContext context) {
    double screenWidth= MediaQuery.of(context).size.width;
    GeneralizedPadding test = GeneralizedPadding(context);
    return Container(
      // color: Colors.red,
      // padding: EdgeInsets.only(left: 5,right: 5),
      // height:test.horizontal(value: 1100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                splashColor: Colors.blue,
                onTap: (){
                },
                child: Container(
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.2,
                  // height: test.horizontal(value: 200),
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[0].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: Color(0xFFFFEEB6),),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: test.vertical(value: 23),
                          // width: test.horizontal(value: ),
                          child:Text(widget.data[0].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[0].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                        ),
                      ),
                     // Expanded(child: SizedBox()),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 30,
                          child: Text(widget.data[0].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
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
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.2,
                  // height: test.horizontal(value: 200),
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[1].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: Color(0xFFFFEEB6),),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: test.vertical(value: 23),
                          // width: test.horizontal(value: ),
                          child:Text(widget.data[1].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[1].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 30,
                            child: Text(widget.data[1].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: test.vertical(value: 10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                splashColor: Colors.blue,
                onTap: (){
                },
                child: Container(
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.2,
                  // height: test.horizontal(value: 200),
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[2].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: Color(0xFFFFEEB6),),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: test.vertical(value: 23),
                          // width: test.horizontal(value: ),
                          child:Text(widget.data[2].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[2].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 30,
                            child: Text(widget.data[2].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
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
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.2,
                  // height: test.horizontal(value: 200),
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[3].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: Color(0xFFFFEEB6),),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: test.vertical(value: 23),
                          // width: test.horizontal(value: ),
                          child:Text(widget.data[3].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[3].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 30,
                            child: Text(widget.data[3].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: test.vertical(value: 10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                splashColor: Colors.blue,
                onTap: (){
                },
                child: Container(
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.2,
                  // height: test.horizontal(value: 200),
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[4].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: Color(0xFFFFEEB6),),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: test.vertical(value: 23),
                          // width: test.horizontal(value: ),
                          child:Text(widget.data[4].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[4].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 30,
                            child: Text(widget.data[4].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
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
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.2,
                  // height: test.horizontal(value: 200),
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[5].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: Color(0xFFFFEEB6),),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: test.vertical(value: 23),
                          // width: test.horizontal(value: ),
                          child:Text(widget.data[5].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[5].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 30,
                            child: Text(widget.data[5].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: test.vertical(value: 10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                splashColor: Colors.blue,
                onTap: (){
                },
                child: Container(
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.2,
                  // height: test.horizontal(value: 200),
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[0].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: Color(0xFFFFEEB6),),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: test.vertical(value: 23),
                          // width: test.horizontal(value: ),
                          child:Text(widget.data[0].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[0].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 30,
                            child: Text(widget.data[0].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
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
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.2,
                  // height: test.horizontal(value: 200),
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[1].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: Color(0xFFFFEEB6),),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: test.vertical(value: 23),
                          // width: test.horizontal(value: ),
                          child:Text(widget.data[1].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[1].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 30,
                            child: Text(widget.data[1].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: test.vertical(value: 10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                splashColor: Colors.blue,
                onTap: (){
                },
                child: Container(
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.2,
                  // height: test.horizontal(value: 200),
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[0].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: Color(0xFFFFEEB6),),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: test.vertical(value: 23),
                          // width: test.horizontal(value: ),
                          child:Text(widget.data[0].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[0].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 30,
                            child: Text(widget.data[0].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
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
                  // height: test.vertical(value: 200),
                  width: screenWidth/2.2,
                  // height: test.horizontal(value: 200),
                  // margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(test.horizontal(value: 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[1].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: Color(0xFFFFEEB6),),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: test.vertical(value: 23),
                          // width: test.horizontal(value: ),
                          child:Text(widget.data[1].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[1].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 30,
                            child: Text(widget.data[1].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
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
