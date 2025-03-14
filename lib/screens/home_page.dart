import 'package:flutter/material.dart';
import 'profile_page.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> openTrips = [
    {"title": "Mountain Escape", "by": "Double Barrels", "location": "Himalayas", "date": "March 10", "image": "assets/app_icon.png"},
    {"title": "Coastal Cruise", "by": "Double Barrels", "location": "Goa", "date": "March 15", "image": "assets/app_icon.png"},
    {"title": "Desert Drift", "by": "Double Barrels", "location": "Rajasthan", "date": "March 20", "image": "assets/app_icon.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Find Your Ride",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/user.png"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Search rides...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Popular Rides",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: openTrips.length,
                itemBuilder: (context, index) {
                  final trip = openTrips[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          trip['image']!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(trip['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("${trip['location']} • ${trip['date']}"),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
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
