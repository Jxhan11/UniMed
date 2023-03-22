import 'package:flutter/material.dart ';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/main.dart';

List<String> itemNames = ['Medical Information'];
List<Icon> leadingIcons = const [
  Icon(Icons.file_copy_sharp)
];
List<Icon> trailingIcons = const [
  Icon(Icons.file_copy_sharp)
];

class ProfilePageWidgets extends StatelessWidget {
  const ProfilePageWidgets({Key? key}) : super(key: key);

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
          _EmergencyInfo(context)
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
          radius: 60,
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

  theTrailingAction(){

  }
  onTapTile(){

  }

  return Container(
    child: Column(
      children: [
        UsefulMediumText(text: "Emergency Info",),
        PoggiesM3List(
            itemNames: itemNames,
            leadingIcons: leadingIcons, trailingIcons: trailingIcons, ctx: ctx, theTrailingAction: theTrailingAction, onTapTile: onTapTile),
      ],
    ),
  );
}
