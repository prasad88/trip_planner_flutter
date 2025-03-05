import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

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

          // Determine if it's the start or finish
          bool isStart = index == 0;
          bool isFinish = index == tripDays.length - 1;

          return TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: isStart,
            isLast: isFinish,
            beforeLineStyle: LineStyle(color: Colors.purple, thickness: 3),
            indicatorStyle: IndicatorStyle(
              width: 30,
              color: isStart
                  ? Colors.purple
                  : isFinish
                      ? Colors.purple
                      : Colors.purple,
              iconStyle: IconStyle(
                iconData: isStart
                    ? Icons.rocket_launch // Start icon
                    : isFinish
                        ? Icons.flag // Finish icon
                        : Icons.circle, // Normal day
                color: Colors.white,
              ),
            ),
            endChild: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                child: ListTile(
                  title: Text(
                    isStart
                        ? "🚀 Start: ${day["start"]} ➝ ${day["end"]}"
                        : isFinish
                            ? "🏁 Finish: ${day["start"]} ➝ ${day["end"]}"
                            : "Day ${index + 1}: ${day["start"]} ➝ ${day["end"]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${day["distance"]} km"),
                  trailing: Icon(Icons.two_wheeler, color: Colors.purple),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
