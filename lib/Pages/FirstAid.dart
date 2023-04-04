import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../theme_constants.dart';
import 'package:lottie/lottie.dart';



class FirstAid extends StatefulWidget {
  const FirstAid({Key? key}) : super(key: key);

  @override
  State<FirstAid> createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {
  final videoUrl = 'https://www.youtube.com/watch?v=7CgtIgSyAiU';

  late YoutubePlayerController _vcontroller;
  late YoutubePlayerController _1vcontroller;
  late YoutubePlayerController _2vcontroller;
  late YoutubePlayerController _3vcontroller;
  late YoutubePlayerController _4vcontroller;
  late YoutubePlayerController _5vcontroller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _vcontroller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: false,
      ),
    );
    super.initState();
  }
  void initState1() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _1vcontroller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _contentStyleHeader = const TextStyle(
        color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
    final _contentStyle = const TextStyle(
        color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

    // print(tapstate);
    GeneralizedPadding test = GeneralizedPadding(context);
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
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
            title: Text('First Aid',
                style: TextStyle(
                    fontFamily: "PSL", fontSize: 22, letterSpacing: 0,color: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill)),
          ),
          SliverToBoxAdapter(
            child: Lottie.asset(
              Theme.of(context).brightness == Brightness.dark? "Animations/Covid_10_Hand_Check.json":"Animations/corona-vaccine.json",
              height: 200,
              repeat: true,
              reverse: true
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              // height: test.vertical(value: 900),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration:BoxDecoration(
                // color: Theme.of(context).brightness==Brightness.dark? DBoxFill:LBoxFill,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ) ,
              
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: ExpansionTile(
                      collapsedBackgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      tilePadding: EdgeInsets.all(10),
                      textColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      iconColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      // trailing: CircleAvatar(
                      //   radius: 20,
                        backgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      //   child: Icon(Icons.health_and_safety_rounded,color: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill),
                      // ),
                      // collapsedBackgroundColor: LBoxFill,
                      title: Container(
                        height: test.vertical(value: 50),
                        decoration: BoxDecoration(
                          // border: Border.all(color:Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,width: 0.5),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: test.horizontal(value: 10),),
                            Icon(Icons.health_and_safety_rounded),
                            Container(padding: EdgeInsets.only(left: test.horizontal(value: 30)), child: Text('Choking',style: TextStyle(fontFamily: "PSL",fontSize: 20),))
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
// height:test.vertical(value: 300),

                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: YoutubePlayer  (
                              controller: _vcontroller,
                              showVideoProgressIndicator: true,
                              onEnded: (metaData) {
                                _vcontroller.seekTo(Duration(seconds: 0));
                                _vcontroller.pause();
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
                          child: Text('Steps To Follow -',style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Step 1 . Give five back blows. Stand to the side and just behind a choking adult. For a child, kneel down behind. Place your arm across the person's chest to support the person's body. Bend the person over at the waist to face the ground. Strike five separate times between the person's shoulder blades with the heel of your hand ",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Step 2 . Give five abdominal thrusts. If back blows don't remove the stuck object, give five abdominal thrusts, also known as the Heimlich maneuver.",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text('Step 3 . Alternate between five blows and five thrusts until the blockage is dislodged.',style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: test.vertical(value: 10),),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: ExpansionTile(
                      collapsedBackgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      tilePadding: EdgeInsets.all(10),
                      textColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      iconColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      // trailing: CircleAvatar(
                      //   radius: 20,
                      backgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      //   child: Icon(Icons.health_and_safety_rounded,color: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill),
                      // ),
                      // collapsedBackgroundColor: LBoxFill,
                      title: Container(
                        height: test.vertical(value: 50),
                        decoration: BoxDecoration(
                          // border: Border.all(color:Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,width: 0.5),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: test.horizontal(value: 10),),
                            Icon(Icons.health_and_safety_rounded),
                            Container(padding: EdgeInsets.only(left: test.horizontal(value: 30)), child: Text('Cardiac Arrest',style: TextStyle(fontFamily: "PSL",fontSize: 20),))
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
                          child: Text('Steps To Follow -',style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Step 1 . Find a person nearby. Make eye contact, point to them, and say: “Call 108.”\n\n\nStep 2 . Start doing chest compressions on the person who needs help. Using both your hands, push down hard and fast in the center of the person’s chest. Let their chest come back up naturally between compressions. Keep going until someone with more training arrives.\n\n\nStep 3 . If you’re trained in CPR, you can use chest compressions and rescue breathing.\n\n\nStep 4 . If it’s available, use an AED. However, do not put off doing chest compressions to go look for an AED. If possible, instruct someone else to go find the device and bring it to you. (AED stands for Automated External Defibrillator)",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        // Container(
                        //   padding: EdgeInsets.all(20),
                        //   child: Text("Step 2 . Give five abdominal thrusts. If back blows don't remove the stuck object, give five abdominal thrusts, also known as the Heimlich maneuver.",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(20),
                        //   child: Text('Step 3 . Alternate between five blows and five thrusts until the blockage is dislodged.',style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        // )
                      ],
                    ),
                  ),
                  SizedBox(height: test.vertical(value: 10),),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: ExpansionTile(
                      collapsedBackgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      tilePadding: EdgeInsets.all(10),
                      textColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      iconColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      // trailing: CircleAvatar(
                      //   radius: 20,
                      backgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      //   child: Icon(Icons.health_and_safety_rounded,color: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill),
                      // ),
                      // collapsedBackgroundColor: LBoxFill,
                      title: Container(
                        height: test.vertical(value: 50),
                        decoration: BoxDecoration(
                          // border: Border.all(color:Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,width: 0.5),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: test.horizontal(value: 10),),
                            Icon(Icons.health_and_safety_rounded),
                            Container(padding: EdgeInsets.only(left: test.horizontal(value: 30)), child: Text('CPR',style: TextStyle(fontFamily: "PSL",fontSize: 20),))
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
                          child: Text('Use CPR when an adult is not breathing or when they are only gasping occasionally, and when they are not responding to questions or taps on the shoulder.\n\nIn children and infants, use CPR when they are not breathing normally and not responding.\n\n\nSteps To Follow -',style: TextStyle(fontFamily: "PSL",fontSize: 20),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Step 1 . Lay the person on their back and open their airway.\n\n\nStep 2 . Start CPR - Perform 30 compressions",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(padding: EdgeInsets.all(10), child: Image.asset('Animations/img.png')),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Step 3 . Perform two rescue breaths",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(padding: EdgeInsets.all(10), child: Image.asset('Animations/img_1.png')),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Step 4 . Repeat",textAlign: TextAlign.left, style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: test.vertical(value: 10),),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: ExpansionTile(
                      collapsedBackgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      tilePadding: EdgeInsets.all(10),
                      textColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      iconColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      // trailing: CircleAvatar(
                      //   radius: 20,
                      backgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      //   child: Icon(Icons.health_and_safety_rounded,color: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill),
                      // ),
                      // collapsedBackgroundColor: LBoxFill,
                      title: Container(
                        height: test.vertical(value: 50),
                        decoration: BoxDecoration(
                          // border: Border.all(color:Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,width: 0.5),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: test.horizontal(value: 10),),
                            Icon(Icons.health_and_safety_rounded),
                            Container(padding: EdgeInsets.only(left: test.horizontal(value: 30)), child: Text('Burns',style: TextStyle(fontFamily: "PSL",fontSize: 20),))
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
                          child: Text('What is a Major Burn?',style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Text("1) Deep\n2) Result in dry, leathery skin\n3) Larger than 3 inches in diameter or cover the face, hands, feet, buttocks, groin, or a major joint\n4) Have a charred appearance or patches of black, brown, or white",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
                          child: Text('What is a Minor Burn?',style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Text("1) Less than 3 inches in diameter\n2) Surface redness (like a sunburn)\n3) Skin blistering\n4) Pain",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
                          child: Text('First Aid for Major Burn',style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Text("Step 1 . Make sure you and the person who’s burned are safe and out of harm’s way. Move them away from the source of the burn. If it’s an electrical burn, turn off the power source before touching them.\n\n\nStep 2 . Check to see if they’re breathing. If needed, start rescue breathing if you’ve been trained.\n\n\nStep 3 . Remove restrictive items from their body, such as belts and jewelry in or near the burned areas. Burned areas typically swell quickly.\n\n\nStep 4 . Cover the burned area. Use a clean cloth or bandage that’s moistened with cool, clean water\n\n\nStep 5 . Separate fingers and toes. If hands and feet are burned, separate the fingers and toes with dry and sterile, nonadhesive bandages.\n\n\nStep 6 . Remove clothing from burned areas, but don’t try to remove clothing that’s stuck to the skin\n\n\nStep 7 . Avoid immersing the person or burned body parts in water. Hypothermia (severe loss of body heat) can occur if you immerse large, severe burns in water.\n\n\nStep 8 . Raise the burned area. If possible, elevate the burned area above their heart.\n\n\nStep 9 . Watch for shock. Signs and symptoms of shock include shallow breathing, pale complexion, and fainting.",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
                          child: Text('First Aid for Minor Burn',style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Text('Step 1 . Cool down the burn. After holding the burn under cool, running water, apply cool, wet compresses until the pain subsides.\n\n\nStep 2 . Remove tight items, such as rings, from the burned area. Be gentle, but move quickly before swelling starts.\n\n\nStep 3 . Avoid breaking blisters. Blisters with fluid protect the area from infection. If a blister breaks, clean the area and gently apply an antibiotic ointment.\n\n\nStep 4 . Apply a moisturizing lotion, such as one with aloe vera. After the burned area has been cooled, apply a lotion to provide relief and to keep the area from drying out.\n\n\nStep 5 . Loosely bandage the burn. Use sterile gauze. Avoid fluffy cotton that could shed and get stuck to the healing area. Also avoid putting too much pressure on the burned skin.\n\n\nStep 6 . Take an over-the-counter pain reliever if necessary. Consider acetaminophen (Tylenol), ibuprofen (Advil), or naproxen (Aleve).\n',style: TextStyle(fontFamily: "PSXL",fontSize: 18),),

                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: test.vertical(value: 10),),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: ExpansionTile(
                      collapsedBackgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      tilePadding: EdgeInsets.all(10),
                      textColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      iconColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      // trailing: CircleAvatar(
                      //   radius: 20,
                      backgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      //   child: Icon(Icons.health_and_safety_rounded,color: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill),
                      // ),
                      // collapsedBackgroundColor: LBoxFill,
                      title: Container(
                        height: test.vertical(value: 50),
                        decoration: BoxDecoration(
                          // border: Border.all(color:Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,width: 0.5),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: test.horizontal(value: 10),),
                            Icon(Icons.health_and_safety_rounded),
                            Container(padding: EdgeInsets.only(left: test.horizontal(value: 30)), child: Text('Drowning',style: TextStyle(fontFamily: "PSL",fontSize: 20),))
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
                          child: Text('Steps To Follow -',style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Step 1 . Do not put yourself in danger when trying to rescue a casualty. ",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Step 2 . When the casualty is rescued from the water, you should first perform a primary survey. If this establishes that they are unresponsive and not breathing, you should ask a helper to call 999 or 112 for emergency help while you start CPR. Ask a helper to find and bring a defibrillator, if available.If you are on your own, use the hands-free speaker on a phone so you can start CPR while speaking to ambulance control.\n\nDo not leave the casualty to look for a defibrillator yourself, the ambulance will bring one\n\n\nStep 3 . Check the airway is open before giving five intial rescue breaths. This is done by placing one hand on the forehead and two fingers (of your other hand) underneath the tip of the chin. Using the hand on the forehead, pinch the casualty's nose with your finger and thumb, allowing the casualty's mouth to fall open. Take a breath and place your lips around the casualty's mouth, forming a seal. Blow into the casualty's mouth until the chest rises.Follow by beginning chest compressions. Kneel by the casualty and put the heel of your hand in the middle of their chest. Put your other hand on top of the first. Interlock your fingers making sure they don't touch the ribs. Keep your arms straight and lean over the casualty. Press down hard, to a third of the depth of the chest, then allow the chest to come back up.After 30 chest compressions, give two rescue breaths. Repeat this at a rate of 100-120 compressions per minute.",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text('Step 4 . Continue to perform CPR until:\n1) Emergency help arrives and takes over\n2) The person starts showing signs of life and starts to breathe normally\n3) You are too exhausted to continue(if there is a helper, you can change over every one-to-two minutes, with minimal interruptions to chest compressions)or \n4) A defibrillator is ready to be used (if the helper returns with a defibrillator, ask them to switch it on and follow the voice prompts while you continue with CPR).\n\n\nStep 5 . Beware, many casualties that drown may bring up stomach contents, so be prepared to roll them onto their side to clear their airway.',style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: test.vertical(value: 10),),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: ExpansionTile(
                      collapsedBackgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      tilePadding: EdgeInsets.all(10),
                      textColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      iconColor: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,
                      // trailing: CircleAvatar(
                      //   radius: 20,
                      backgroundColor: Theme.of(context).brightness == Brightness.dark? DBoxFill:LBoxFill,
                      //   child: Icon(Icons.health_and_safety_rounded,color: Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill),
                      // ),
                      // collapsedBackgroundColor: LBoxFill,
                      title: Container(
                        height: test.vertical(value: 50),
                        decoration: BoxDecoration(
                          // border: Border.all(color:Theme.of(context).brightness == Brightness.dark? LBoxFill:DBoxFill,width: 0.5),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: test.horizontal(value: 10),),
                            Icon(Icons.health_and_safety_rounded),
                            Container(padding: EdgeInsets.only(left: test.horizontal(value: 30)), child: Text('Fractures',style: TextStyle(fontFamily: "PSL",fontSize: 20),))
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
                          child: Text('Steps To Follow -',style: TextStyle(fontFamily: "PSM",fontSize: 20),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Step 1 . Stop bleeding, especially in the case of open fracture where the skin is torn, by wrapping the wound with a sterile bandage or a clean cloth.\n\n\nStep 2 . Avoid moving the affected area; any movement can result in serious complications—especially in the case of neck and back fractures. ",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Step 3 . Cool the affected area by applying and ice pack or ice cubes wrapped in a clean cloth.\n\n\nStep 4 . Treat the patient's shock: help them get into a comfortable position, encourage them to rest, and reassure them. Cover them with a blanket or clothing to keep them warm.",style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text('Step 5 . Call the ambulance, and help the patient get to the emergency department for examination and treatment.',style: TextStyle(fontFamily: "PSXL",fontSize: 18),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: test.vertical(value: 10),),

                  SizedBox(height: test.vertical(value: 10),),
                  
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}
// Container(
// margin: EdgeInsets.all(20),
// // height:test.vertical(value: 300),
//
// child: ClipRRect(
// borderRadius: BorderRadius.all(Radius.circular(20)),
// child: YoutubePlayer(
// controller: _vcontroller,
// showVideoProgressIndicator: true,
// onEnded: (metaData) {
// _vcontroller.seekTo(Duration(seconds: 0));
// _vcontroller.pause();
// },
// ),
// ),
// ),