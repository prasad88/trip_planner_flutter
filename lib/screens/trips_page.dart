import 'package:flutter/material.dart';
import 'view_trip_page.dart';
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
      "location" : "Pune",
      "budget": 5000,
      "transportMode": "Bike",
      "isPrivate": true,
      "riders": [{"name":"Alice","image":""}, {"name":"Bob","image":""}],
      "itinerary": [
        {"start": "City A", "end": "City B", "distance": "120 km"},
        {"start": "City B", "end": "City C", "distance": "100 km"}
      ],
      "image": "assets/default_trip.jpg",
      "description": "Embark on an exhilarating motorcycle ride from Pune to the captivating Konkan region! This journey promises breathtaking scenery, winding roads, and the thrill of adventure. Riders traverse the lush Western Ghats, enjoy the cool breeze of mountain passes, and descend towards the stunning coastline dotted with pristine beaches and quaint villages. It's the perfect escape for nature lovers and thrill-seekers, blending scenic beauty with the joy of the open road. Every turn of this route is a memory waiting to be made!"
    },
    {
      "name": "Mountain Adventure",
      "startDate": "2025-03-15",
      "endDate": "2025-03-17",
      "location" : "Pune",
      "budget": 5000,
      "transportMode": "Bike",
      "isPrivate": false,
      "riders": [{"name":"Alice","image":""}, {"name":"Bob","image":""}, {"name":"Charlie","image":""}, {"name":"David","image":""}, 
      {"name":"Eve","image":""}, {"name":"Frank","image":""}, {"name":"Grace","image":""}, {"name":"Helen","image":""}],
      "itinerary": [
        {"start": "Town X", "end": "Hill Y", "distance": "80 km"},
        {"start": "Hill Y", "end": "Valley Z", "distance": "90 km"}
      ],
      "image": "assets/default_trip.jpg",
      "description": "Embark on an exhilarating motorcycle ride from Pune to the captivating Konkan region! This journey promises breathtaking scenery, winding roads, and the thrill of adventure. Riders traverse the lush Western Ghats, enjoy the cool breeze of mountain passes, and descend towards the stunning coastline dotted with pristine beaches and quaint villages. It's the perfect escape for nature lovers and thrill-seekers, blending scenic beauty with the joy of the open road. Every turn of this route is a memory waiting to be made!"
    }
  ];

  List<Map<String, dynamic>> pastTrips = [
    {
      "name": "Desert Ride",
      "startDate": "2025-02-10",
      "endDate": "2025-02-12",
      "location" : "Pune",
      "budget": 5000,
      "transportMode": "Bike",
      "isPrivate": true,
      "riders": [{"name":"Alice","image":""}, {"name":"Bob","image":""}],
      "itinerary": [
        {"start": "Oasis A", "end": "Dune B", "distance": "150 km"},
        {"start": "Dune B", "end": "City C", "distance": "200 km"}
      ],
      "image": "assets/default_trip.jpg",
      "description": "Embark on an exhilarating motorcycle ride from Pune to the captivating Konkan region! This journey promises breathtaking scenery, winding roads, and the thrill of adventure. Riders traverse the lush Western Ghats, enjoy the cool breeze of mountain passes, and descend towards the stunning coastline dotted with pristine beaches and quaint villages. It's the perfect escape for nature lovers and thrill-seekers, blending scenic beauty with the joy of the open road. Every turn of this route is a memory waiting to be made!"
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
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          String totalDistance = _calculateTotalDistance(trip["itinerary"]);
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
                  Row(
                    children: [
                      Icon(Icons.event, size: 16),
                      SizedBox(width: 4),
                      Text("${trip["startDate"]} - ${trip["endDate"]}"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.directions, size: 16),
                      SizedBox(width: 4),
                      Text("Total Distance: $totalDistance"),
                    ],
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewTripPage(tripDetails: trip),
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
            heroTag: "toggleTripsBtn",
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _openAddTripForm,
            child: Icon(Icons.add),
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
