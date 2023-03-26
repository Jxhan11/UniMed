import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../theme_constants.dart';

class FirstAid extends StatefulWidget {
  const FirstAid({Key? key}) : super(key: key);


  @override
  State<FirstAid> createState() => _FirstAidState();
}


class _FirstAidState extends State<FirstAid> {
  final videoUrl = 'https://www.youtube.com/watch?v=xvFZjo5PgG0';

  late YoutubePlayerController _vcontroller;

  @override
  void initState(){
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _vcontroller=YoutubePlayerController(
        initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        controlsVisibleAtStart: false,

      ),
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    GeneralizedPadding test = GeneralizedPadding(context);
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
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              // height:test.vertical(value: 300),
              
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: YoutubePlayer(
                  controller: _vcontroller,
                  showVideoProgressIndicator: true,
                  onEnded: (metaData){
                    _vcontroller.seekTo(Duration(seconds:0));
                    _vcontroller.pause();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}






