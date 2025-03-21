import 'package:flutter/material.dart';
import '../main.dart'; // Import the appPurple constant

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add SafeArea to prevent the rider photo from being cut by the camera notch
            SafeArea(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/rider_background.jpg"), // Set the background image
                    fit: BoxFit.cover, // Cover the entire container
                  ),
                ),
                child: Column(
                  children: [
                    // Add a thick border directly around the CircleAvatar
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Use appPurple for the border color
                          width: 1, // Thickness of the border
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 70, // Adjust radius to fit the border
                        backgroundImage: AssetImage("assets/user.png"),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "John Doe",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "Adventure Rider | Explorer",
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSection("Motorcycles Owned", [
              _buildListItem(Icons.motorcycle, "Royal Enfield Himalayan"),
              _buildListItem(Icons.motorcycle, "KTM Duke 390"),
            ]),
            _buildSection("Riding Gear", [
              _buildListItem(Icons.security, "Full-face Helmet"),
              _buildListItem(Icons.checkroom, "Riding Jacket"),
              _buildListItem(Icons.hiking, "Riding Boots"),
              _buildListItem(Icons.pan_tool, "Gloves"),
            ]),
            _buildSection("Achievements & Badges", [
              _buildListItem(Icons.emoji_events, "🏆 Longest Ride: 2000 km in 5 days"),
              _buildListItem(Icons.directions_bike, "🏅 Off-road Champion 2023"),
              _buildListItem(Icons.star, "🎖️ Certified Tour Guide"),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Column(children: children),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: appPurple), // Use appPurple for the icon color
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
