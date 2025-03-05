import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'package:trip_planner/main.dart';

class HomeScreen extends StatelessWidget {
  final String username = "Rider"; // Static username for now
  final String userImage = "assets/user.png"; // Placeholder user image

  final List<Map<String, String>> openTrips = [
    {"title": "Mountain Escape", "location": "Himalayas", "date": "March 10", "image": "assets/app_icon.png"},
    {"title": "Coastal Cruise", "location": "Goa", "date": "March 15", "image": "assets/app_icon.png"},
    {"title": "Desert Drift", "location": "Rajasthan", "date": "March 20", "image": "assets/app_icon.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20), // Adjust for notch
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      (context.findAncestorStateOfType<MainScreenState>())?.onItemTapped(2);
                    },
                    child: CircleAvatar(
                      radius: 50, // Increased size
                      backgroundImage: AssetImage(userImage),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Hey $username, Ready to Ride?",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {}, // Placeholder for starting a trip
              child: Text("Start a Trip"),
            ),
            SizedBox(height: 16), // Reduced space
            Text(
              "Find Open Trips to Join",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8), // Reduced space
            Expanded(
              child: ListView.builder(
                itemCount: openTrips.length,
                itemBuilder: (context, index) {
                  final trip = openTrips[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(
                        trip['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(trip['title']!),
                      subtitle: Text("Location: ${trip['location']} | Date: ${trip['date']}"),
                      trailing: ElevatedButton(
                        onPressed: () {}, // Placeholder for join trip action
                        child: Text("Join"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}