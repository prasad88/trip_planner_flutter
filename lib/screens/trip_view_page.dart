import 'package:flutter/material.dart';

class TripViewPage extends StatelessWidget {
  final String tripName;
  final List<Map<String, String>> tripDays;

  TripViewPage({required this.tripName, required this.tripDays});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tripName)),
      body: ListView.builder(
        itemCount: tripDays.length,
        itemBuilder: (context, index) {
          final day = tripDays[index];
          return Card(
            child: ListTile(
              title: Text("Day ${index + 1}: ${day["start"]} → ${day["end"]}"),
              subtitle: Text("Distance: ${day["distance"]}"),
            ),
          );
        },
      ),
    );
  }
}
