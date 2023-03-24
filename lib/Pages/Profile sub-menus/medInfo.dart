import 'package:flutter/material.dart';
import 'package:unimed/Components/usefulStuff.dart';

class MedicalInformation extends StatelessWidget {
  MedicalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralizedPadding test = GeneralizedPadding(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: test.horizontal(value: 25), top: test.vertical(value: 25)),
              child: Text("hi"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,top: 25),
              child: Text("hi"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,top: 10),
              child: Text("hi"),
            ),
          ],
        ),
      ),
    );
  }
}
