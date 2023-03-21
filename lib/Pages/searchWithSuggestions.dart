import 'package:flutter/material.dart';

class SearchWithSuggestionsPage extends StatelessWidget {
  const SearchWithSuggestionsPage({Key? key}) : super(key: key);

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
            title: const Hero(
              tag: 'search-text',
              child: Material(
                color: Colors.transparent,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
