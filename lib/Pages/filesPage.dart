import 'package:flutter/material.dart';
import 'package:unimed/Components/usefulStuff.dart';
import 'package:unimed/Pages/searchWithSuggestions.dart';

class FilesPageWidgets extends StatefulWidget {
  const FilesPageWidgets({Key? key}) : super(key: key);

  @override
  State<FilesPageWidgets> createState() => _FilesPageWidgetsState();
}

class _FilesPageWidgetsState extends State<FilesPageWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SearchWithSuggestionsPage()),
                        );
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
                              const Hero(
                                tag: 'search-text',
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    "Search for documents",
                                    style: TextStyle(
                                      fontFamily: 'PSL',
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
          //TODO: Mediaquery padding
          const SliverPadding(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            sliver: SliverToBoxAdapter(
              child: UsefulMediumText(
                text: "Files",
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                        (context, index) {
                  return FileCard(
                      "SomeReally Long Name of File wwwwwwww",
                      "https://placekitten.com/g/200/200");
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 2),
            ),
          )
        ],
      ),
    );
  }
}

//////////////////////////////////// Custom Widgets

FileCard(text, imgUrl) {
  return InkWell(
    onTap: () {},
    child: Ink(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:  SizedBox(
                height: 100,
                width: 160,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(imgUrl),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.picture_as_pdf),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 130,
                  height: 40, // set a fixed height to limit the number of lines
                  child: Text(
                    text,
                    maxLines: 2, // limit the number of lines to 2
                    overflow: TextOverflow.ellipsis, // show an ellipsis if the text overflows
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
