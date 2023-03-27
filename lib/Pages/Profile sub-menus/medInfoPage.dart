import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sliding_switch/sliding_switch.dart';
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
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: Hero(
              tag: 'search-icon-leading',
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            title: const Text("Medical Information"),
            actions: [
              Padding(
                  padding: EdgeInsets.only(top: 8,bottom: 8,right: GeneralizedPadding(context).horizontal(value: 24)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 2.0),
                    ),
                    onPressed: (){
                      Fluttertoast.showToast(
                          msg: "Changes saved",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          // backgroundColor: Colors.red,
                          // textColor: Colors.white,
                          // fontSize: 16.0
                      );
                    },
                    child: const Text("Save")),
              )
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: GeneralizedPadding(context).vertical(value: 26),horizontal: GeneralizedPadding(context).horizontal(value: 25)),
            sliver: SliverToBoxAdapter(
              child: MedDetails(),
            ),
          ),
        ],
      ),
    );
  }
}

class Contact {
  String name;
  String email;
  String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}
List<Contact> contacts = [
  Contact(name: 'John Smith', email: 'john@example.com', phoneNumber: '555-1234'),
  Contact(name: 'Jane Doe', email: 'jane@example.com', phoneNumber: '555-5678'),
];

class NameField extends StatelessWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController(text: 'Keanu Reeves');
    return Row(
      children: [
        const Icon(Icons.person_outline_rounded),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: GeneralizedPadding(context).horizontal(value: 16)),
          child: SizedBox(
            width: GeneralizedPadding(context).horizontal(value: 300),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                    color: Colors.grey[600]
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class BloodField extends StatelessWidget {
  const BloodField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController(text: 'B+');
    return Row(
      children: [
        const Icon(Icons.water_drop_outlined),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: GeneralizedPadding(context).horizontal(value: 16)),
          child: SizedBox(
            width: GeneralizedPadding(context).horizontal(value: 300),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Blood Group',
                labelStyle: TextStyle(
                    color: Colors.grey[600]
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PhoneField extends StatelessWidget {
  const PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController(text: '+91 951-8279-007');
    return Row(
      children: [
        const Icon(Icons.phone_outlined),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: GeneralizedPadding(context).horizontal(value: 16)),
          child: SizedBox(
            width: GeneralizedPadding(context).horizontal(value: 300),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(

                labelText: 'Phone Number',
                labelStyle: TextStyle(
                    color: Colors.grey[600]
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AllergiesField extends StatelessWidget {
  const AllergiesField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController(text: 'None');
    return Row(
      children: [
        const Icon(Icons.snowing),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: GeneralizedPadding(context).horizontal(value: 16)),
          child: SizedBox(
            width: GeneralizedPadding(context).horizontal(value: 300),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Allergies',
                labelStyle: TextStyle(
                    color: Colors.grey[600]
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AddressField extends StatelessWidget {
  const AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController(text: 'C Block 614');
    TextEditingController _controller2 = new TextEditingController(text: 'Stark Tower');
    TextEditingController _controller3 = new TextEditingController(text: 'VIT Bhopal');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.house_outlined),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: GeneralizedPadding(context).horizontal(value: 16)),
              child: SizedBox(
                width: GeneralizedPadding(context).horizontal(value: 300),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Address line 1',
                    labelStyle: TextStyle(
                        color: Colors.grey[600]
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: GeneralizedPadding(context).vertical(value: 12),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: GeneralizedPadding(context).horizontal(value: 16)),
              child: SizedBox(
                width: GeneralizedPadding(context).horizontal(value: 300),
                child: TextField(
                  controller: _controller2,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Line 2',
                    labelStyle: TextStyle(
                        color: Colors.grey[600]
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: GeneralizedPadding(context).vertical(value: 12),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: GeneralizedPadding(context).horizontal(value: 16)),
              child: SizedBox(
                width: GeneralizedPadding(context).horizontal(value: 300),
                child: TextField(
                  controller: _controller3,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Line 3',
                    labelStyle: TextStyle(
                        color: Colors.grey[600]
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController(text: 'keanureeves@gmail.com');
    return Row(
      children: [
        const Icon(Icons.email_outlined),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: GeneralizedPadding(context).horizontal(value: 16)),
          child: SizedBox(
            width: GeneralizedPadding(context).horizontal(value: 300),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                    color: Colors.grey[600]
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class OrganDonor extends StatelessWidget {
  const OrganDonor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingSwitch(
      value: false,
      width: GeneralizedPadding(context).horizontal(value: 130),
      onChanged: (bool value) {
        print(value);
      },
      height: GeneralizedPadding(context).vertical(value: 40),
      animationDuration: const Duration(milliseconds: 400),
      onTap: () {},
      onDoubleTap: () {},
      onSwipe: () {},
      textOff: "No",
      textOn: "Yes",
      colorOff: const Color(0xffdc6c73),
      colorOn: const Color(0xff6682c0),
      background: Colors.white,
      buttonColor: Theme.of(context).cardColor,
      inactiveColor: const Color(0xff636f7b),
    );
  }
}


class MedDetails extends StatefulWidget {
  const MedDetails({Key? key}) : super(key: key);

  @override
  State<MedDetails> createState() => _MedDetailsState();
}
class _MedDetailsState extends State<MedDetails> {
  @override
  Widget build(BuildContext context) {
    GeneralizedPadding gp = GeneralizedPadding(context);
    double _height_between_fields = 10.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NameField(),
        SizedBox(height: gp.vertical(value: _height_between_fields),),
        BloodField(),
        SizedBox(height: gp.vertical(value: _height_between_fields),),
        PhoneField(),
        SizedBox(height: gp.vertical(value: _height_between_fields),),
        AddressField(),
        SizedBox(height: gp.vertical(value: _height_between_fields),),
        EmailField(),
        SizedBox(height: gp.vertical(value: _height_between_fields),),
        AllergiesField(),
        SizedBox(height: gp.vertical(value: _height_between_fields),),

      ],
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
        duration: const Duration(milliseconds: 600),
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
                style: const TextStyle(
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


something(context){
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
                : const Color(0xFF303030),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
              },
              child: Padding(
                  padding: const EdgeInsets.only(left: 24),
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
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).brightness == Brightness.dark? const Color(0xFFFF8E8E): Colors.red,
                radius: 18,
                child: const Icon(Icons.person_rounded,),
              ),
            ),
            // SizedBox(width: 1,),
          ],
        ),
      ),
    ),
  );
}