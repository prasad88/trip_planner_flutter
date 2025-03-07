import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddRideForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onRideAdded;

  AddRideForm({required this.onRideAdded});

  @override
  _AddRideFormState createState() => _AddRideFormState();
}

class _AddRideFormState extends State<AddRideForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _transportModeController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newRide = {
        "name": _nameController.text,
        "startDate": _startDateController.text,
        "endDate": _endDateController.text,
        "location": _locationController.text,
        "description": _descriptionController.text,
        "budget": _budgetController.text,
        "transportMode": _transportModeController.text,
        "image": _image?.path ?? "assets/default_trip.jpg"
      };
      widget.onRideAdded(newRide);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _image != null ? FileImage(_image!) : AssetImage("assets/default_trip.jpg") as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: _pickImage,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                BackButton(),
                SizedBox(width: 8),
                Text(
                  "Add Ride",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Ride Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.title),
                    ),
                    validator: (value) => value!.isEmpty ? "Enter a ride name" : null,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _startDateController,
                    decoration: InputDecoration(
                      labelText: "Start Date",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: () => _selectDate(context, _startDateController),
                    validator: (value) => value!.isEmpty ? "Enter start date" : null,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _endDateController,
                    decoration: InputDecoration(
                      labelText: "End Date",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: () => _selectDate(context, _endDateController),
                    validator: (value) => value!.isEmpty ? "Enter end date" : null,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      labelText: "Location",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    validator: (value) => value!.isEmpty ? "Enter location" : null,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.description),
                    ),
                    validator: (value) => value!.isEmpty ? "Enter a description" : null,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _budgetController,
                    decoration: InputDecoration(
                      labelText: "Budget",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    validator: (value) => value!.isEmpty ? "Enter budget" : null,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _transportModeController,
                    decoration: InputDecoration(
                      labelText: "Transport Mode",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.directions_car),
                    ),
                    validator: (value) => value!.isEmpty ? "Enter transport mode" : null,
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 60),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _submitForm,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.rocket_launch, size: 24),
                  SizedBox(width: 8),
                  Text("Let's Ride!", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
