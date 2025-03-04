import 'package:flutter/material.dart';
import 'trip_view_page.dart'; // Import the Trip View page

class TripsPage extends StatelessWidget {
  final List<Map<String, dynamic>> trips = [
    {
      "name": "Weekend Getaway",
      "days": [
        {"start": "City A", "end": "City B", "distance": "120"},
        {"start": "City B", "end": "City C", "distance": "100"},
        {"start": "City C", "end": "City D", "distance": "150"},
      ]
    },
    {
      "name": "Mountain Adventure",
      "days": [
        {"start": "Town X", "end": "Hill Y", "distance": "80"},
        {"start": "Hill Y", "end": "Valley Z", "distance": "90"},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Trips")),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return Card(
            child: ListTile(
              title: Text(trip["name"]),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TripViewPage(
                      tripName: trip["name"],
                      tripDays: List<Map<String, String>>.from(trip["days"]),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
