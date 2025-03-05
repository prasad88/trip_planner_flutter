import 'package:flutter/material.dart';
import 'trip_view_page.dart';
import 'add_trip_form.dart';

class TripsPage extends StatefulWidget {
  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  List<Map<String, dynamic>> trips = [
    {
      "name": "Weekend Getaway",
      "startDate": "2025-03-10",
      "endDate": "2025-03-12",
      "days": [
        {"start": "City A", "end": "City B", "distance": "120 km"},
        {"start": "City B", "end": "City C", "distance": "100 km"},
        {"start": "City B", "end": "City C", "distance": "100 km"},
        {"start": "City B", "end": "City C", "distance": "100 km"},
        {"start": "City B", "end": "City C", "distance": "100 km"},
        {"start": "City B", "end": "City C", "distance": "100 km"},
        {"start": "City B", "end": "City C", "distance": "100 km"},
      ],
      "image": "assets/app_icon.png"
    },
    {
      "name": "Mountain Adventure",
      "startDate": "2025-03-15",
      "endDate": "2025-03-17",
      "days": [
        {"start": "Town X", "end": "Hill Y", "distance": "80 km"},
        {"start": "Hill Y", "end": "Valley Z", "distance": "90 km"},
        {"start": "Hill Y", "end": "Valley Z", "distance": "90 km"},
        {"start": "Hill Y", "end": "Valley Z", "distance": "90 km"},
        {"start": "Hill Y", "end": "Valley Z", "distance": "90 km"},
      ],
      "image": "assets/app_icon.png"
    }
  ];

  void _openAddTripForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddTripForm(
        onTripAdded: (newTrip) {
          setState(() {
            trips.add(newTrip);
          });
        },
      ),
    );
  }

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
              leading: Image.asset(
                trip['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(trip["name"]),
              subtitle: Text("📅 ${trip["startDate"]} - ${trip["endDate"]}"),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTripForm,
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
