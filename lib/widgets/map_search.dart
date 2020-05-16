import 'package:flutter/material.dart';

class MapSearch extends SearchDelegate<String> {
  final events = [
    "event 1",
    "evento 2",
    "eventos 3",
    "even 4",
    "event 5",
    "events 6",
  ];

  final recentEvents = [
    "eventos 3",
    "even 4",
    "event 5",
  ];

  @override
  String get searchFieldLabel => 'Pesquisar evento';

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentEvents
        : events.where((event) => event.startsWith(query)).toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
            query = suggestionList[index];
          },
          leading: Icon(Icons.event),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: suggestionList.length,
      ),
    );
  }
}
