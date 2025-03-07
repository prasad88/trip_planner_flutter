import 'package:flutter/material.dart';

class ViewTripPage extends StatelessWidget {
  final Map<String, dynamic> tripDetails;

  static const String defaultImage = "assets/default_trip.jpg";
  static const String defaultUserImage = "assets/user.png";
  static const String noDescription = "No description provided.";
  static const String ridersTitle = "Riders";
  static const String rideOverviewTitle = "Ride Overview";
  static const String keySpotsTitle = "Key Spots";
  static const String keyFeaturesTitle = "Key Features";
  static const String rideRequirementsTitle = "Ride Requirements";
  static const List<String> keySpots = ["Fort 1", "Fort 2", "Beach 1", "Beach 2", "Garden 1", "Garden 2"];
  static const List<String> keyFeatures = ["Breakfast included", "Free giveaway", "Free stay", "Live music"];
  static const List<String> rideRequirements = ["Helmet", "Safety Jacket", "Riding Boots", "Driving License", "Vehicle Insurance"];

  ViewTripPage({required this.tripDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tripDetails['name']),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Trip Image
                Stack(
                  children: [
                    Image.asset(
                      tripDetails['image'] ?? defaultImage,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        color: Colors.black54,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          tripDetails['location'],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                // Trip Name and Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tripDetails['name'],
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      ExpandableText(
                        text: tripDetails['description'] ?? noDescription,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // Riders List
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$ridersTitle (${tripDetails['riders'].length})",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 140, // Increased height to accommodate larger images and names
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: tripDetails['riders'].length,
                            itemBuilder: (context, index) {
                              final rider = tripDetails['riders'][index];
                              final riderImage = (rider['image'] != null && rider['image'].isNotEmpty)
                                  ? rider['image']
                                  : defaultUserImage;
                              return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 40, // Increased size
                                      backgroundImage: AssetImage(riderImage),
                                    ),
                                    SizedBox(height: 8),
                                    SizedBox(
                                      width: 80, // Set a fixed width for the text container
                                      child: Text(
                                        rider['name'],
                                        style: TextStyle(fontSize: 14),
                                        overflow: TextOverflow.ellipsis, // Handle overflow
                                        textAlign: TextAlign.center, // Center align the text
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Trip Overview
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(rideOverviewTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.date_range, color: Colors.purple),
                            SizedBox(width: 8),
                            Text("Start Date: ${tripDetails['startDate']}"),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.date_range, color: Colors.purple),
                            SizedBox(width: 8),
                            Text("End Date: ${tripDetails['endDate']}"),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.attach_money, color: Colors.purple),
                            SizedBox(width: 8),
                            Text("Budget: ₹${tripDetails['budget']}"),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.directions_bike, color: Colors.purple),
                            SizedBox(width: 8),
                            Text("Transport: ${tripDetails['transportMode']}"),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.purple),
                            SizedBox(width: 8),
                            Text("Location: ${tripDetails['location']}"),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.lock, color: tripDetails['isPrivate'] ? Colors.red : Colors.purple),
                            SizedBox(width: 8),
                            Text("Visibility: ${tripDetails['isPrivate'] ? 'Private' : 'Public'}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Key Spots
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(keySpotsTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        for (var spot in keySpots)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.purple),
                                SizedBox(width: 8),
                                Text(spot),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Key Features
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(keyFeaturesTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        for (var feature in keyFeatures)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.purple),
                                SizedBox(width: 8),
                                Text(feature),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Essential Gear
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(rideRequirementsTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        for (var requirement in rideRequirements)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Row(
                              children: [
                                Icon(Icons.done, color: Colors.purple),
                                SizedBox(width: 8),
                                Text(requirement),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80), // Add space for floating buttons
              ],
            ),
          ),
          Positioned(
            bottom: 168, // Adjusted position for the first button
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Navigate to trip_view_page.dart
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TripViewPage()),
                );
              },
              child: Icon(Icons.remove_red_eye),
              mini: true, // Reduced size
            ),
          ),
          Positioned(
            bottom: 112, // Adjusted position for the second button
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Edit trip action
              },
              child: Icon(Icons.edit),
              mini: true, // Reduced size
            ),
          ),
          Positioned(
            bottom: 56, // Adjusted position for the third button
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Show confirmation dialog before exiting the trip
                _showExitConfirmationDialog(context);
              },
              child: Icon(Icons.exit_to_app),
              backgroundColor: const Color.fromARGB(255, 247, 163, 157),
              mini: true, // Reduced size
            ),
          ),
        ],
      ),
    );
  }

  void _showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Exit Trip"),
          content: Text("Are you sure you want to exit the trip?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Perform the exit trip action here
              },
              child: Text("Exit"),
            ),
          ],
        );
      },
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  ExpandableText({required this.text, this.maxLines = 3});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _expanded ? null : widget.maxLines,
          overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Text(
            _expanded ? "Show less" : "Show more",
            style: TextStyle(color: Colors.purple),
          ),
        ),
      ],
    );
  }
}

class TripViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip View"),
      ),
      body: Center(
        child: Text("Trip View Page"),
      ),
    );
  }
}
