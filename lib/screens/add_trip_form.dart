import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddTripForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onTripAdded;

  AddTripForm({required this.onTripAdded});

  @override
  _AddTripFormState createState() => _AddTripFormState();
}

class _AddTripFormState extends State<AddTripForm> {
  final _formKey = GlobalKey<FormState>();
  String _tripName = "";
  String _startLocation = "";
  String _endLocation = "";
  String _distance = "";
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _pickDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2024);
    DateTime lastDate = DateTime(2030);

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_startDate == null || _endDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select both start and end dates")),
        );
        return;
      }
      if (_startDate!.isAfter(_endDate!)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Start date must be before end date")),
        );
        return;
      }

      _formKey.currentState!.save();

      Map<String, dynamic> newTrip = {
        "name": _tripName,
        "startDate": DateFormat('yyyy-MM-dd').format(_startDate!),
        "endDate": DateFormat('yyyy-MM-dd').format(_endDate!),
        "days": [
          {"start": _startLocation, "end": _endLocation, "distance": "$_distance km"}
        ]
      };

      widget.onTripAdded(newTrip);
      Navigator.pop(context); // Close the modal
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Add New Trip", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Trip Name"),
                  validator: (value) => value!.isEmpty ? "Enter a trip name" : null,
                  onSaved: (value) => _tripName = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Start Location"),
                  validator: (value) => value!.isEmpty ? "Enter start location" : null,
                  onSaved: (value) => _startLocation = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "End Location"),
                  validator: (value) => value!.isEmpty ? "Enter end location" : null,
                  onSaved: (value) => _endLocation = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Distance (km)"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) return "Enter distance";
                    if (double.tryParse(value) == null) return "Enter a valid number";
                    return null;
                  },
                  onSaved: (value) => _distance = value!,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => _pickDate(context, true),
                        child: Text(_startDate == null
                            ? "Select Start Date"
                            : "Start: ${DateFormat('yyyy-MM-dd').format(_startDate!)}"),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () => _pickDate(context, false),
                        child: Text(_endDate == null
                            ? "Select End Date"
                            : "End: ${DateFormat('yyyy-MM-dd').format(_endDate!)}"),
                      ),
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
        ],
      ),
    );
  }
}
