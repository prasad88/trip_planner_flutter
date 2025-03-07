import 'package:flutter/material.dart';
import 'trip_view_page.dart';
import 'add_trip_form.dart';

class TripsPage extends StatefulWidget {
  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  bool showPastTrips = false;
  
  List<Map<String, dynamic>> upcomingTrips = [
    {
      "name": "Weekend Getaway",
      "startDate": "2025-03-10",
      "endDate": "2025-03-12",
      "days": [
        {"start": "City A", "end": "City B", "distance": "120 km"},
        {"start": "City B", "end": "City C", "distance": "100 km"}
      ],
      "image": "assets/app_icon.png"
    },
    {
      "name": "Mountain Adventure",
      "startDate": "2025-03-15",
      "endDate": "2025-03-17",
      "days": [
        {"start": "Town X", "end": "Hill Y", "distance": "80 km"},
        {"start": "Hill Y", "end": "Valley Z", "distance": "90 km"}
      ],
      "image": "assets/app_icon.png"
    }
  ];

  List<Map<String, dynamic>> pastTrips = [
    {
      "name": "Desert Ride",
      "startDate": "2025-02-10",
      "endDate": "2025-02-12",
      "days": [
        {"start": "Oasis A", "end": "Dune B", "distance": "150 km"},
        {"start": "Dune B", "end": "City C", "distance": "200 km"}
      ],
      "image": "assets/app_icon.png"
    }
  ];

  void _openAddTripForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddRideForm(
        onRideAdded: (newTrip) {
          setState(() {
            upcomingTrips.add(newTrip);
          });
        },
      ),
    );
  }

  void _toggleTripsView() {
    setState(() {
      showPastTrips = !showPastTrips;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> trips = showPastTrips ? pastTrips : upcomingTrips;
    return Scaffold(
      appBar: AppBar(
        title: Text(showPastTrips ? "Past Trips" : "Upcoming Trips"),
      ),
      body: ListView.separated(
        itemCount: trips.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final trip = trips[index];
          String totalDistance = _calculateTotalDistance(trip["days"]);
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  trip['image'] ?? 'assets/placeholder.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(trip["name"], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("📅 ${trip["startDate"]} - ${trip["endDate"]}"),
                  Text("🛣️ Total Distance: $totalDistance")
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _toggleTripsView,
            child: Icon(showPastTrips ? Icons.schedule : Icons.history),
            backgroundColor: Colors.purple,
            heroTag: "toggleTripsBtn",
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _openAddTripForm,
            child: Icon(Icons.add),
            backgroundColor: Colors.purple,
            heroTag: "addTripBtn",
          ),
        ],
      ),
    );
  }

  String _calculateTotalDistance(List<dynamic> days) {
    int totalDistance = 0;
    for (var day in days) {
      String distanceStr = day["distance"].split(" ")[0];
      totalDistance += int.tryParse(distanceStr) ?? 0;
    }
    return "$totalDistance km";
  }
}
