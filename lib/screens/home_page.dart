import 'package:flutter/material.dart';
import '../main.dart'; // Import the appPurple constant
import 'profile_page.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> openTrips = [
    {"title": "Mountain Escape", "location": "Himalayas", "date": "March 10", "image": "assets/default_trip.jpg"},
    {"title": "Coastal Cruise", "location": "Goa", "date": "March 15", "image": "assets/default_trip.jpg"},
    {"title": "Desert Drift", "location": "Rajasthan", "date": "March 20", "image": "assets/default_trip.jpg"},
    {"title": "Forest Adventure", "location": "Amazon", "date": "March 25", "image": "assets/default_trip.jpg"},
  ];

  final List<Map<String, String>> discoverTracks = [
    {"title": "Himalayan Trail", "location": "Himalayas", "date": "March 12", "image": "assets/default_track.jpg"},
    {"title": "Coastal Path", "location": "Goa", "date": "March 18", "image": "assets/default_track.jpg"},
    {"title": "Desert Safari", "location": "Rajasthan", "date": "March 22", "image": "assets/default_track.jpg"},
    {"title": "Rainforest Trek", "location": "Amazon", "date": "March 28", "image": "assets/default_track.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with profile picture
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Hello, Alex",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: CircleAvatar(
                        radius: 28, // Increased radius to fix the cut-off issue
                        backgroundImage: AssetImage("assets/user.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Ready to ride?",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              SizedBox(height: 12),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for rides...",
                    prefixIcon: Icon(Icons.search, color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Open Rides Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Open Rides",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle "View All" action
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(color: appPurple), // Use the purple color here
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),

              // Open Rides Grid
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: openTrips.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final trip = openTrips[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100], // Light grey background for cards
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          trip['image']!,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  trip['title']!,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  trip['location']!,
                                  style: TextStyle(color: Colors.black54, fontSize: 12),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  trip['date']!,
                                  style: TextStyle(color: Colors.black54, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16),

              // Discover Tracks Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discover Tracks",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle "View All" action
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(color: appPurple), // Use the purple color here
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),

              // Discover Tracks Grid
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: discoverTracks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final track = discoverTracks[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100], // Light grey background for cards
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          track['image']!,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  track['title']!,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  track['location']!,
                                  style: TextStyle(color: Colors.black54, fontSize: 12),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  track['date']!,
                                  style: TextStyle(color: Colors.black54, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
