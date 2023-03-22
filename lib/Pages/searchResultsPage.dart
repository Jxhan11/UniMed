import 'package:flutter/material.dart';

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
          SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
