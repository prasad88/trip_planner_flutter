import 'package:flutter/material.dart';
import 'profile_page.dart';

class HomeScreen extends StatelessWidget {
  final String username = "Rider"; // Static username for now
  final String userImage = "assets/user.png"; // Placeholder user image

  final List<Map<String, String>> openTrips = [
    {"title": "Mountain Escape", "by":"Double Barrels", "location": "Himalayas", "date": "March 10", "image": "assets/app_icon.png"},
    {"title": "Coastal Cruise", "by":"Double Barrels", "location": "Goa", "date": "March 15", "image": "assets/app_icon.png"},
    {"title": "Desert Drift", "by":"Double Barrels", "location": "Rajasthan", "date": "March 20", "image": "assets/app_icon.png"},
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
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
                      title: Text(trip['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(trip['location']!, style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.groups, size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(trip['by']!, style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(trip['date']!, style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
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