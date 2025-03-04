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
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple.shade100,
                radius: 20,
                child: FittedBox(
                  child: Text(
                    "Day\n${index + 1}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                ),
              ),
              title: Text("${day["start"]} → ${day["end"]}"),
              subtitle: Text("Estimated Distance: ${day["distance"]} km"),
            ),
          );
        },
      ),
    );
  }
}
