// The Trip class is a simple data model that represents a trip. 
//It has four properties: name, destination, startDate, and endDate. 
//The Trip class is used in the TripsScreen widget to display a list of trips.
class Trip {
  final String name;
  final String destination;
  final DateTime startDate;
  final DateTime endDate;

  Trip({
    required this.name,
    required this.destination,
    required this.startDate,
    required this.endDate,
  });
}