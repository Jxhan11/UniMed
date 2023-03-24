import 'package:flutter/material.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/Pages/searchResultsPage.dart';
import 'package:unimed/main.dart';

class SearchWithSuggestionsPage extends StatefulWidget {
  const SearchWithSuggestionsPage({Key? key}) : super(key: key);
  @override
  State<SearchWithSuggestionsPage> createState() =>
      _SearchWithSuggestionsPageState();
}

class _SearchWithSuggestionsPageState extends State<SearchWithSuggestionsPage> {
  TextEditingController searchController = TextEditingController();
  bool enableCrossButtonInSliverAppBar = false;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (searchController.text.isNotEmpty) {
      setState(() {
        enableCrossButtonInSliverAppBar = true;
      });
    } else {
      setState(() {
        enableCrossButtonInSliverAppBar = false;
      });
    }
  }

  void _userPressedEnter(text) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => searchResults(searchTerm: text)),
    );
  }

  void _clearText() {
    searchController.clear();
    _onTextChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
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
          title: Hero(
            tag: 'search-text',
            child: Material(
              color: Colors.transparent,
              child: TextField(
                textInputAction: TextInputAction.search,
                controller: searchController,
                onSubmitted: (text) {
                  _userPressedEnter(text);
                },
                onChanged: (text) {
                  _onTextChanged();
                },
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search UniMed',
                  border: InputBorder.none,
                  suffixIcon: enableCrossButtonInSliverAppBar
                      ? IconButton(
                          onPressed: () {
                            _clearText();
                          },
                          icon: const Icon(Icons.clear),
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        )
                      : null,
                ),
              ),
            ),
          ),
        ),
        const SubHeadlines(text: "Recent Searches"),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          sliver: SliverToBoxAdapter(
            child: PoggiesM3List(
                onTapTile: theTrailingActions,
                ctx: context,
                itemNames: [
                  "example1",
                  "example2",
                  "example3",
                  "example4",
                  "example5",
                  "example6"
                ],
                leadingIcons: [
                  Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
                trailingIcons: [
                  Icon(
                    Icons.close,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Icon(
                    Icons.close,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Icon(
                    Icons.close,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Icon(
                    Icons.close,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Icon(
                    Icons.close,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Icon(
                    Icons.close,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
                theTrailingAction: theTrailingActions),
          ),
        )
      ],
    ));
  }
}

//// debugging purposes

void go1(){
  print("cross 1 is tapped");
}
void go2(){
  print("cross 2 is tapped");
}
void go3(){
  print("cross 3 is tapped");
}
void go4(){
  print("cross 4 is tapped");
}
void go5(){
  print("cross 5 is tapped");
}
void go6(){
  print("cross 6 is tapped");
}

List<Function> theTrailingActions = [
  go1,go2,go3,go4,go5,go6
];
