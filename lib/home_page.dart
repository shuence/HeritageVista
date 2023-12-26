// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:heritage_vista/data/sites.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heritage_vista/sites/heritage_details.dart';
import 'package:heritage_vista/utils/bottom_navigation.dart';
import 'package:heritage_vista/utils/video_player.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heritage Vista',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HeritageVistaHomePage(title: 'Heritage Vista'),
    );
  }
}

class HeritageVistaHomePage extends StatefulWidget {
  const HeritageVistaHomePage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  _HeritageVistaHomePageState createState() => _HeritageVistaHomePageState();
}

class _HeritageVistaHomePageState extends State<HeritageVistaHomePage> {
  List<HeritageSite> displayedHeritageSites = [];

  int _currentIndex = 0;
  bool isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    // Initialize displayedHeritageSites with all heritage sites on app start
    displayedHeritageSites = List.from(allHeritageSites);
  }

  void searchHeritageSites(String query) {
    setState(() {
      displayedHeritageSites = allHeritageSites
          .where(
              (site) => site.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
        toolbarTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Row(
                children: [
                  // User icon from material.dart
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person), // Use a user-related icon
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Heritage Vista',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Add functionality to navigate to the home page
              },
            ),
          ],
        ),
      ),
      body: _getBody(_currentIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return _getHomeBody();
      case 1:
        return _getSearchBody();
      case 2:
        return _getReelsBody();
      case 3:
        return _getUserBody();
      default:
        return Container();
    }
  }

  Widget _getHomeBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: displayedHeritageSites.length,
            itemBuilder: (BuildContext context, int index) {
              return HeritageSiteBox(
                  heritageSite: displayedHeritageSites[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _getSearchBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: searchHeritageSites,
            decoration: const InputDecoration(
              hintText: 'Search Heritage Sites',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: displayedHeritageSites.length,
            itemBuilder: (BuildContext context, int index) {
              return HeritageSiteBox(
                  heritageSite: displayedHeritageSites[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _getReelsBody() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          VideoPlayerWidget(videoId: 'YkVeLlsXQgU'),
          VideoPlayerWidget(videoId: 'Fim1BA3HMK0'),
          VideoPlayerWidget(videoId: 'DV_r9tw8uo8'),
          VideoPlayerWidget(videoId: 'u3XqRZcjTX0'),
        ],
      ),
    );
  }
}

Widget _getUserBody() {
  // Placeholder for User functionality
  return const Center(
    child: Text('User Body'),
  );
}

class HeritageSiteBox extends StatelessWidget {
  final HeritageSite heritageSite;

  const HeritageSiteBox({Key? key, required this.heritageSite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 600;

    return GestureDetector(
      onTap: () {
        // Navigate to the details page when the site is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HeritageDetailsPage(heritageSite: heritageSite),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return CarouselSlider(
                  items: heritageSite.images.map((image) {
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8.0,
                            spreadRadius: 4.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: isDesktop ? 300.0 : 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: isDesktop ? 0.4 : 0.8,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Heritage Site in India',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    heritageSite.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Location: ${heritageSite.location}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
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
