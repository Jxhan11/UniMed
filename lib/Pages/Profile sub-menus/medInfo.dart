import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unimed/Components/usefulStuff.dart';

class MedicalInformation extends StatefulWidget {
  MedicalInformation({Key? key}) : super(key: key);

  @override
  State<MedicalInformation> createState() => _MedicalInformationState();
}

class _MedicalInformationState extends State<MedicalInformation> {
  bool isAnimationDone = false;

  void animationIsCompleted(){
    Future.delayed(const Duration(milliseconds: 200),(){
      setState(() {
        isAnimationDone = true;
      });
      print("anims done");
    });
  }

  @override
  Widget build(BuildContext context) {
    GeneralizedPadding test = GeneralizedPadding(context);

    // Future.delayed(Duration(seconds: 2),(){
    //   setState(() {
    //     _isAnimationDone = true;
    //   });
    // });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            collapsedHeight: 60,
            title: Padding(
              //TODO: Make the padding and height relative.
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Color(0xFF303030),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Container(
                          child: Row(
                            children: [
                              Hero(
                                tag: 'search-icon-leading',
                                child: Material(
                                  color: Colors.transparent,
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: Theme.of(context).brightness ==
                                        Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Hero(
                                tag: 'search-text',
                                child: Material(
                                  color: Colors.transparent,
                                  child: JustUniMed(),
                                ),
                              ) ,
                              // Stack(
                              //   children: [
                              //     UniMedSearchBarAnimation(isAnimationDone: _isAnimationDone,),
                              //     Hero(
                              //       tag: 'search-text',
                              //       child: Material(
                              //         color: Colors.transparent,
                              //         child: Text(
                              //           "Search for healthcare facilities",
                              //           style: TextStyle(
                              //             fontFamily: 'PSL',
                              //             letterSpacing: 0,
                              //             fontWeight: FontWeight.w500,
                              //             color: Colors.grey,
                              //             fontSize: 15,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        )
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).brightness == Brightness.dark? Color(0xFFFF8E8E): Colors.red,
                        radius: 18,
                        child: Icon(Icons.person_rounded,),
                      ),
                    ),
                    // SizedBox(width: 1,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UniMedSearchBarAnimation extends StatefulWidget {
  void Function() isAnimationDone;
  UniMedSearchBarAnimation({Key? key, required this.isAnimationDone}) : super(key: key);

  @override
  State<UniMedSearchBarAnimation> createState() => _UniMedSearchBarAnimationState();
}

class _UniMedSearchBarAnimationState extends State<UniMedSearchBarAnimation> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  Animation<double>? _opacityValues ;
  String? text = "UniMed";
  bool secondHalf = false;
  int speed = 600;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: speed),
        vsync: this
    );
    Future.delayed(const Duration(milliseconds: 500),(){
      _controller.forward();
    });
    _opacityValues = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);

    _controller.addStatusListener((status) {
      print(status);
      if(status == AnimationStatus.completed){
        if(!secondHalf){
          setState(() {
            text = "Search for healthcare facilities";
            secondHalf = true;
          });
          _controller.reverse().then((value) => ()=> {
            _controller.forward()
          });
        }
      }
      if(status == AnimationStatus.dismissed && secondHalf){
        Future.delayed(const Duration(milliseconds: 600),(){
          speed = 200;
          _controller.forward().then((value) => widget.isAnimationDone());
        });
      }
    });



  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _){
          return Opacity(
            opacity: _opacityValues!.value,
              child: Container(
                child: Expanded(
                  child: Center(
                      child: Text(
                        text!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'PSL',
                          letterSpacing: 0,
                          // fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 15,
                        ),)),
                ),
              )
          );
      }
    );
  }
}



class JustUniMed extends StatefulWidget {
  JustUniMed({Key? key}) : super(key: key);

  @override
  State<JustUniMed> createState() => _JustUniMedState();
}

class _JustUniMedState extends State<JustUniMed> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  Animation<double>? _animation;
  String? text = "UniMed";
  Animation? ctween;
  // FontWeight? ftwt = FontWeight.normal;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 600),
        vsync: this
    );
    Future.delayed(const Duration(milliseconds: 500),(){
      _controller.forward();
    });
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
    // ctween = ColorTween(begin: Colors.black, end: Colors.grey).animate(_controller);

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        // widget.afterAnimation();
        setState(() {
          text = "Search for healthcare facilities";
        });
        _controller.reverse();
      }
    });

  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _){
          return Opacity(
              opacity: _animation!.value,
              child: Text(
                text!,
                style: TextStyle(
                  fontFamily: 'PSL',
                  letterSpacing: 0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15,
                ),
              )
          );
        }
        );
  }
}
