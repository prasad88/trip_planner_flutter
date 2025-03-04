import 'package:flutter/material.dart';
import 'package:trip_planner/models/trip.dart';

class AddTripScreen extends StatefulWidget {
  final Function(Trip) onTripAdded;

  AddTripScreen({required this.onTripAdded});

  @override
  _AddTripScreenState createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final _formKey = GlobalKey<FormState>();
  String _tripName = '';
  String _destination = '';
  DateTime? _startDate;
  DateTime? _endDate;

  void _submitForm() {
    if (_formKey.currentState!.validate() && _startDate != null && _endDate != null) {
      final newTrip = Trip(
        name: _tripName,
        destination: _destination,
        startDate: _startDate!,
        endDate: _endDate!,
      );

      widget.onTripAdded(newTrip);
      Navigator.pop(context); // Go back to the trips screen
    }
  }

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Trip")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Trip Name"),
                validator: (value) => value!.isEmpty ? "Enter a trip name" : null,
                onChanged: (value) => _tripName = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Destination"),
                validator: (value) => value!.isEmpty ? "Enter a destination" : null,
                onChanged: (value) => _destination = value,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(_startDate == null ? "Start Date: Not Selected" : "Start: ${_startDate!.toLocal().toString().split(' ')[0]}"),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, true),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(_endDate == null ? "End Date: Not Selected" : "End: ${_endDate!.toLocal().toString().split(' ')[0]}"),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, false),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Add Trip"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
