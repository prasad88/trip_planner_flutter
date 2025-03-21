import 'package:flutter/material.dart';
import '../main.dart'; // Import the appPurple constant

class ProfilePage extends StatelessWidget {
  // Static data declared as variables
  final String riderName = "John Doe";
  final String riderType = "Adventure Rider";
  final int badgesCount = 5; // Limit to max 5 in the UI
  final int followersCount = 1200; // Represented as 1.2k
  final int followingCount = 350;
  final String totalKms = "12,000";
  final String totalRides = "150";
  final String activeDays = "365";
  final String longestRide = "2,000 km";

  final List<Map<String, String>> achievements = [
    {"icon": "🏆", "title": "Longest Ride: 2000 km in 5 days"},
    {"icon": "🏅", "title": "Off-road Champion 2023"},
    {"icon": "🎖️", "title": "Certified Tour Guide"},
  ];

  final List<String> garage = [
    "Royal Enfield Himalayan",
    "KTM Duke 390",
  ];

  final List<String> gear = [
    "Full-face Helmet",
    "Riding Jacket",
    "Riding Boots",
    "Gloves",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Rider Photo with Background + Gradient Overlay
              Stack(
                children: [
                  Container(
                    height: 240, // Reduced from 290 to move content up
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/rider_background.jpg"), // Background image
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Gradient overlay for better text visibility
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.3),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Avatar with border and a slight drop shadow
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                            border: Border.all(
                              color: Colors.black, // Black border around the photo
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 60, // Increased radius for larger profile picture
                            backgroundImage: AssetImage("assets/user.png"), // Rider photo
                          ),
                        ),
                        SizedBox(width: 16),
                        // Rider Info
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              riderName,
                              style: TextStyle(
                                fontSize: 26, // Slightly larger font size
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              riderType,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 12),
                            // Display up to 5 badges as emojis
                            Row(
                              children: _buildBadgeEmojis(badgesCount),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Combined card: Followers/Following + Quick Stats
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Followers and Following
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatItem("Followers", "${followersCount ~/ 1000}.${followersCount % 1000 ~/ 100}k"),
                            _buildStatItem("Following", "$followingCount"),
                          ],
                        ),
                        SizedBox(height: 12),
                        Divider(thickness: 1),
                        SizedBox(height: 12),
                        // Quick Stats
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildQuickStat("Total KMs", totalKms),
                            _buildQuickStat("Total Rides", totalRides),
                            _buildQuickStat("Active Days", activeDays),
                            _buildQuickStat("Longest Ride", longestRide),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Tabs for Achievements, Stats, Garage, and Gear (icon-based)
              TabBar(
                indicatorColor: appPurple,
                labelColor: appPurple,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(icon: Icon(Icons.emoji_events)),  // Achievements
                  Tab(icon: Icon(Icons.bar_chart)),     // Stats
                  Tab(icon: Icon(Icons.motorcycle)),    // Garage
                  Tab(icon: Icon(Icons.checkroom)),     // Gear
                ],
              ),
              SizedBox(
                height: 400, // Height for TabBarView
                child: TabBarView(
                  children: [
                    _buildAchievementsTab(),
                    _buildStatsTab(),    // Displays combined stats again
                    _buildGarageTab(),
                    _buildGearTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Builds up to 5 emoji badges to simulate looking like “ranked generals”
  List<Widget> _buildBadgeEmojis(int count) {
    final int maxCount = count > 5 ? 5 : count; // Maximum 5
    // Using "🎖️" as a placeholder
    return List.generate(
      maxCount,
      (index) => Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Text(
          "🎖️",
          style: TextStyle(fontSize: 22), // Adjust size as needed
        ),
      ),
    );
  }

  // Helper to build stat items (Followers, Following)
  Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  // Helper to build quick stats (Total KMs, Total Rides, etc.)
  Widget _buildQuickStat(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  // Achievements Tab
  Widget _buildAchievementsTab() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: achievements.map((achievement) {
        return _buildListItem(Icons.emoji_events, achievement["title"]!);
      }).toList(),
    );
  }

  // Stats Tab – show the same combined stats card
  Widget _buildStatsTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Followers and Following
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem("Followers", "${followersCount ~/ 1000}.${followersCount % 1000 ~/ 100}k"),
                  _buildStatItem("Following", "$followingCount"),
                ],
              ),
              SizedBox(height: 12),
              Divider(thickness: 1),
              SizedBox(height: 12),
              // Quick Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickStat("Total KMs", totalKms),
                  _buildQuickStat("Total Rides", totalRides),
                  _buildQuickStat("Active Days", activeDays),
                  _buildQuickStat("Longest Ride", longestRide),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Garage Tab
  Widget _buildGarageTab() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: garage.map((item) {
        return _buildListItem(Icons.motorcycle, item);
      }).toList(),
    );
  }

  // Gear Tab
  Widget _buildGearTab() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: gear.map((item) {
        return _buildListItem(Icons.checkroom, item);
      }).toList(),
    );
  }

  // Helper to build list items
  Widget _buildListItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: appPurple),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
