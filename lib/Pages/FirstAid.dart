import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimed/Components/usefulStuff.dart';

import '../theme_constants.dart';

class FirstAid extends StatefulWidget {
  const FirstAid({Key? key}) : super(key: key);

  @override
  State<FirstAid> createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {
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
            title: Text('First Aid',style: TextStyle(fontFamily: "PSL",fontSize: 22,letterSpacing: 0)),
          ),
          
        ],
      ),
    );
  }
}




