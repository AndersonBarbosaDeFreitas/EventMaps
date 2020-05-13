import 'package:event_map/widgets/explorar_itens/category.dart';
import 'package:event_map/widgets/explorar_itens/list_events.dart';
import 'package:event_map/widgets/map_search.dart';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  BottomBarController controller;
  List<CategoryWidget> categories = [
    CategoryWidget(
      name: "Congressos",
      color: Color(0xFF1E88E5),
      image: "assets/icons_categories/congress.svg",
    ),
    CategoryWidget(
      name: "Cursos",
      color: Color(0xFFE53935),
      image: "assets/icons_categories/course_degree.svg",
    ),
    CategoryWidget(
      name: "Música",
      color: Color(0xFFFF9800),
      image: "assets/icons_categories/music_note.svg",
    ),
    CategoryWidget(
      name: "Palestras",
      color: Color(0xFF4CAF50),
      image: "assets/icons_categories/blackboard.svg",
    ),
    CategoryWidget(
      name: "Simpósios",
      color: Color(0xFF009688),
      image: "assets/icons_categories/symposium.svg",
    ),
    CategoryWidget(
      name: "Sociais",
      color: Color(0xFFE91E63),
      image: "assets/icons_categories/family.svg",
    ),
    CategoryWidget(
      name: "Tecnologia",
      color: Color(0xFF00BCD4),
      image: "assets/icons_categories/chip.svg",
    ),
    CategoryWidget(
      name: "Tudo",
      color: Color(0xFF795548),
      image: "assets/icons_categories/all.svg",
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller = new BottomBarController(
      vsync: this,
      dragLength: 550,
      snap: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF37474F)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {
              showSearch(context: context, delegate: MapSearch());
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      // body: Container(
      //   color: Colors.grey,
      // ),
      //Local do Mapa
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: _kGooglePlex,
              zoomControlsEnabled: false,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onVerticalDragUpdate: controller.onDrag,
        onVerticalDragEnd: controller.onDragEnd,
        child: FloatingActionButton.extended(
          icon: Icon(Icons.location_on),
          label: Text(
            "Explorar",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          elevation: 2,
          backgroundColor: Color(0xFF02C99C),
          foregroundColor: Colors.white,
          onPressed: () => controller.swap(),
        ),
      ),
      bottomNavigationBar: BottomExpandableAppBar(
        controller: controller,
        appBarHeight: 0.0,
        horizontalMargin: 0,
        bottomOffset: 35,
        bottomAppBarColor: Colors.transparent,
        expandedHeight: MediaQuery.of(context).size.height / 1.7,
        expandedDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        expandedBody: SingleChildScrollView(child: _buildExpandedBody()),
        bottomAppBarBody: Row(
          mainAxisSize: MainAxisSize.max,
        ),
      ),
    );
  }

  Column _buildExpandedBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        )),
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            bottom: 10,
          ),
          child: Text(
            "Perto de você",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildListEvents(),
        Padding(padding: EdgeInsets.all(5)),
        _buildCategories(),
      ],
    );
  }

  Container _buildListEvents() {
    return Container(
      height: 145,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                ListEventsWidget(
                  name: "Event 1",
                  image: "",
                ),
                ListEventsWidget(
                  name: "Event 2",
                  image: "",
                ),
                ListEventsWidget(
                  name: "Event 3",
                  image: "",
                ),
                ListEventsWidget(
                  name: "Event 4",
                  image: "",
                ),
                ListEventsWidget(
                  name: "Event 5",
                  image: "",
                ),
                ListEventsWidget(
                  name: "Event 6",
                  image: "",
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Center _buildCategories() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            return categories[index];
          },
        ),
      ),
    );
  }
}
