import 'package:flutter/material.dart ';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/Pages/Profile%20sub-menus/medInfo.dart';
import 'package:unimed/main.dart';

List<String> itemNames = ['Medical Information','Emergency Contacts'];
List<Icon> leadingIcons = const [
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp)
];
List<String> itemNames2 = ['Orders','Documents','Appointments'];
List<Icon> leadingIcons2 = const [
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp)
];
List<String> itemNames3 = ['About','Accessibility','Check for updates','Feedback','Settings','Logout'];
List<Icon> leadingIcons3 = const [
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp)
];
List<Icon> trailingIcons = const [
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp),
  Icon(Icons.file_copy_sharp)
];

class ProfilePageWidgets extends StatefulWidget {
  const ProfilePageWidgets({Key? key}) : super(key: key);

  @override
  State<ProfilePageWidgets> createState() => _ProfilePageWidgetsState();
}

class _ProfilePageWidgetsState extends State<ProfilePageWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            //TODO: Padding in Mediaquery somehow
            padding: const EdgeInsets.only(top: 40),
            child: _Profile(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
          child: _EmergencyInfo(context)
            ,),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: _MiscStuff(context)
            ,),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: _SupportStuff(context)
            ,),
          SizedBox(height: 20,)


        ],
      ),
    );
  }
}

///////////////////////////////// WIDGETS///////////////////////////////////////

_Profile() {
  return Container(
    // Profile Container
    child: Column(
      children: const [
        CircleAvatar(
          radius: 50,
          child: Icon(Icons.person),
        ),
        UsefulBigText(text: "Kamaboko Monjiro"),
        UsefulSubheading(
          text: "ggezclapwp@test.com",
        )
      ],
    ),
  );
}
_EmergencyInfo(ctx){
  void go1(){
    // Medical Information
    Navigator.push(
        ctx,
        MaterialPageRoute(
        builder: (context) =>
        MedicalInformation()));
  }
  void go2(){}
  void go3(){}
  void go4(){}
  void go5(){}
  void go6(){}

  List<Function> theTrailingActions = [
    go1,go2,go3,go4,go5,go6
  ];
  List<Function> theMainActions = [
    go1,go2,go3,go4,go5,go6
  ];
  onTapTile(){

  }

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          //TODO: Mediaquery padding
          padding: const EdgeInsets.only(left: 32.0,top: 16,bottom: 16),
          child: UsefulMediumText(text: "Emergency Info",),
        ),
        PoggiesM3List(
            itemNames: itemNames,
            leadingIcons: leadingIcons, ctx: ctx, theTrailingAction: theTrailingActions, onTapTile: theMainActions),
      ],
    ),
  );
}
_MiscStuff(ctx){
  void go1(){}
  void go2(){}
  void go3(){}
  void go4(){}
  void go5(){}
  void go6(){}

  List<Function> theTrailingActions = [
    go1,go2,go3,go4,go5,go6
  ];
  List<Function> theMainActions = [
    go1,go2,go3,go4,go5,go6
  ];
  onTapTile(){

  }

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          //TODO: Mediaquery padding
          padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8),
          child: UsefulMediumText(text: "Misc",),
        ),
        PoggiesM3List(
            itemNames: itemNames2,
            leadingIcons: leadingIcons2, ctx: ctx, theTrailingAction: theTrailingActions, onTapTile: theMainActions),
      ],
    ),
  );
}
_SupportStuff(ctx){
  void go1(){
    print("cross 1 is tapped");
  }
  void go2(){
    print("cross 2 is tapped");
  }
  void go3(){
    print("cross 3 is tapped");
  }
  void go4(){
    print("cross 4 is tapped");
  }
  void go5(){
    print("cross 5 is tapped");
  }
  void go6(){
    print("cross 6 is tapped");
  }
  void go12(){
    print("tile 1 is tapped");
  }

  List<Function> theTrailingActions = [
      go1,go2,go3,go4,go5,go6
  ];
  List<Function> theMainActions = [
    go12,go2,go3,go4,go5,go6
  ];
  void onTapTile(){

  }

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          //TODO: Mediaquery padding
          padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8),
          child: UsefulMediumText(text: "Support",),
        ),
        PoggiesM3List(
            itemNames: itemNames3,
            leadingIcons: leadingIcons3, ctx: ctx,
            theTrailingAction: theTrailingActions, onTapTile: theMainActions),
      ],
    ),
  );
}
