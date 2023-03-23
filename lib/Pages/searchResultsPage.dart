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
                  icon: Icon(Icons.arrow_back, color: Theme.of(context).brightness ==
                      Brightness.dark
                      ? Colors.white
                      : Colors.black,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            title:  Hero(
              tag: 'search-text',
              child: Material(
                color: Colors.transparent,
                child: Text(widget.searchTerm)
              ),
            ),
          ),
          SubHeadlines(text: 'Diagnosis'),
          SliverToBoxAdapter(
            child: PoggiesM3List(itemNames: [
              "20% . Common Cold",
              "40% . Tonsils",
              "40% . Food Poisoning"
            ],
                ctx: context,
                theTrailingAction: theTrailingActions,
                onTapTile: theTrailingActions),
          ),

        ],
      ),
    );
  }
}

void go1(){
  print("cross 1 is tapped");
}
void go2(){
  print("cross 2 is tapped");
}
void go3(){
  print("cross 3 is tapped");
}


List<Function> theTrailingActions = [
  go1,go2,go3
];