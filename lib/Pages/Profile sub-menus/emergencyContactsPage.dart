import 'package:flutter/material.dart';
import 'package:unimed/Components/usefulStuff.dart';

class _Contacts {
  String name;
  String firstLetter;

  _Contacts({required this.name}) : firstLetter = name[0];
}

List<_Contacts> contacts = [_Contacts(name: "Mom"), _Contacts(name: "Dad"),];

class EmergencyContacts extends StatelessWidget {
  const EmergencyContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralizedPadding _gp = GeneralizedPadding(context);
    return Scaffold(
      floatingActionButton: SizedBox(
        height: _gp.vertical(value: 60),
        width: _gp.horizontal(value: 60),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            // padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 2.0),
          ),
          onPressed: (){},
          child: Icon(Icons.add),
        ),
      ),
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
            title: const Text("Emergency Contacts"),

          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  onTap: (){},
                  leading: CircleAvatar(child: Text(contacts[index].firstLetter),),
                  title: UsefulMediumText(text:contacts[index].name),
                  trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.phone_outlined),
                  ),
                );
              },
              childCount: contacts.length,
            ),
          )
        ],
      ),
    );
  }
}
