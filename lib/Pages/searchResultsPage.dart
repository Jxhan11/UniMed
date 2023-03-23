import 'package:flutter/material.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/Pages/searchWithSuggestions.dart';
import 'package:unimed/main.dart';

class searchResults extends StatefulWidget {
  final searchTerm;
  const searchResults({Key? key, required this.searchTerm}) : super(key: key);

  @override
  State<searchResults> createState() => _searchResultsState();
}

class _searchResultsState extends State<searchResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            title: Hero(
              tag: 'search-text',
              child: Material(
                  color: Colors.transparent, child: Text(widget.searchTerm)),
            ),
          ),
          SubHeadlines(text: 'Diagnosis'),
          Diagnosis(),
        ],
      ),
    );
  }
}

class Diagnosis extends StatefulWidget {
  const Diagnosis({Key? key}) : super(key: key);

  @override
  State<Diagnosis> createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),

              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '20% . Common Cold',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 3,),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                // borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),

              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '40% . Tonsils',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 3,),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),

              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '40% . Food Poisoning',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white10,
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(Icons.person_rounded,),
                    radius: 30,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: Text(
                      'Consult A Doctor',
                      style: TextStyle(
                        fontSize: 15,

                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
