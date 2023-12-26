import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heritage_vista/sites/3d_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:heritage_vista/data/sites.dart';

class HeritageDetailsPage extends StatelessWidget {
  final HeritageSite heritageSite;

  const HeritageDetailsPage({Key? key, required this.heritageSite})
      : super(key: key);
      

  @override
  Widget build(BuildContext context) {
      final bool isDesktop = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(
        title: Text('${heritageSite.name} Details'),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CarouselSlider(
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
              ),
         
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
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
                    const SizedBox(height: 16.0),
                    const Text(
                      'More Details:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      heritageSite.history,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Top Attractions:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Display top attractions
                    for (final attraction in heritageSite.topAttractions)
                      Text(
                        '• $attraction',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Nearby Sites:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Display nearby sites
                    for (final nearbySite in heritageSite.nearbySites)
                      Text(
                        '• $nearbySite',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ThreeDViewWidget(
                                  siteName: heritageSite.name,
                                ),
                              ),
                            );
                          },
                          child: const Text('View Site in 3D'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _launchMaps(heritageSite.location, heritageSite.name);
                          },
                          child: const Text('Show Directions'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Function to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl('$uri' as Uri);
  }

// Function to launch Google Maps with Directions
Future<void> _launchMaps(String location, String siteName) async {
  final Uri uri = Uri.parse(
    'https://www.google.com/maps/dir/?api=1&destination=$location&query=$siteName',
  );
  print(uri);
  await launchUrl(uri);
}

}
