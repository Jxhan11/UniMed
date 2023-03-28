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


final List<InsuranceSeries>data = [
  InsuranceSeries(
    rating: Text('5') ,
    insuranceName:Text('Rashtiya Swasthiya Bima Yojana (RSBY)',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('RSBY ( Rashtriya Swasthiya Bima Yojana)  has been launched by Ministry of Labour and Employment, Government of India to provide health insurance coverage for Below Poverty Line (BPL) families. The objective of RSBY is to provide protection to BPL households from financial liabilities arising out of health shocks that involve hospitalization.',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('30Rs to Register',style: TextStyle(fontFamily: "PSXL",fontSize: 15),overflow: TextOverflow.ellipsis,maxLines: 1,),
  ),
  InsuranceSeries(
    rating: Text('4') ,
    insuranceName:Text('Employment State Insurance Scheme (ESIS)',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('Employees’ State Insurance Scheme of India, is a multidimensional social security system tailored to provide socio-economic protection to worker population and their dependants covered under the scheme.',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('Working Class Earning upto 21k / month',style: TextStyle(fontFamily: "PSXL",fontSize: 15,overflow: TextOverflow.ellipsis),maxLines: 1,),
  ),
  InsuranceSeries(
    rating: Text('3') ,
    insuranceName:Text('Central Government Health Scheme (CGHS)',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('The “Central Government Health Scheme” (CGHS) provides comprehensive health care facilities for the Central Govt. employees and pensioners and their dependents residing in CGHS covered cities. Started in New Delhi in 1954, Central',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('Free',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
  ),
  InsuranceSeries(
    rating: Text('4') ,
    insuranceName:Text('Aam Aadmi Bima Yojana(AABY)',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
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
  InsuranceSeries(
    rating: Text('1') ,
    insuranceName:Text('Insurance Plan 7',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('Only If u are earning less than 10k a month',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('2k/month',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
  ),
  InsuranceSeries(
    rating: Text('5') ,
    insuranceName:Text('Insurance Plan 8',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('Only If u are earning less than 10k a month',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('2k/month',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
  ),
  InsuranceSeries(
    rating: Text('5') ,
    insuranceName:Text('Insurance Plan 9',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
    info: Text('Only If u are earning less than 10k a month',style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
    price: Text('2k/month',style: TextStyle(fontFamily: "PSXL",fontSize: 15)),
  ),
  InsuranceSeries(
    rating: Text('5') ,
    insuranceName:Text('Insurance Plan 10',style: TextStyle(fontFamily: "PSL",fontSize: 20),) ,
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
  final ScrollController _scrollController = ScrollController();

  bool _showGridView = true;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter == 0) {
      setState(() {
        _showGridView = false;
      });
      _scrollToNextSliver();
    } else {
      setState(() {
        _showGridView = true;
      });
    }
  }

  void _scrollToNextSliver() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification){
          if(!_showGridView){
            return true;
          }
          return false;
        },
        child: CustomScrollView(
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
            SliverToBoxAdapter(
              child: InsuranceCards(
                data: data,
              ),
            ),


          ],
        ),
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
    double screenHeight= MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.3;
    final double itemWidth = size.width / 2;
    GeneralizedPadding test = GeneralizedPadding(context);
    return Container(
      padding: EdgeInsets.only(left: test.horizontal(value: 10),right: test.horizontal(value: 10),bottom: test.vertical(value: 10)),
      height: screenHeight/1.14,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing:20,
              // crossAxisSpacing: 10,
              childAspectRatio: (itemWidth/itemHeight)
          ),
          itemBuilder: (BuildContext context,int index){
            return Container(
              margin: EdgeInsets.only(left: test.horizontal(value: 10),right: test.horizontal(value: 10)),
              padding: EdgeInsets.all(test.horizontal(value: 20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
              ),

              child: InkWell(
                onTap: (){
                },
                splashColor: Colors.blue,
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min ,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Text(widget.data[index].rating!.data!,textAlign: TextAlign.right, style: TextStyle(fontFamily: "PSXL",fontSize: 15),),
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
                          child:Text(widget.data[index].insuranceName!.data!,style: TextStyle(fontFamily: "PSM",fontSize: 20,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        ),
                      ),
                      SizedBox(height: test.vertical(value: 10),),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: test.vertical(value: 50),
                          child: Text(widget.data[index].info!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),maxLines: 3,overflow: TextOverflow.ellipsis,),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      Expanded(child: SizedBox(height: 1,)),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: test.vertical(value: test.vertical(value: 18)),
                            child: Text(widget.data[index].price!.data!,style: TextStyle(fontFamily: "PSXL",fontSize: 15),)
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
