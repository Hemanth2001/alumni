import 'package:flutter/material.dart';

class AlumniProfilePage extends StatefulWidget {
  const AlumniProfilePage({Key? key}) : super(key: key);

  @override
  _AlumniProfilePageState createState() => _AlumniProfilePageState();
}

class _AlumniProfilePageState extends State<AlumniProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = "John Doe";
  String _email = "johndoe@example.com";
  String _phone = "555-555-5555";
  String _yearOfPassing = "2010";
  String _branch = "Computer Science";
  String _usn = "1RV10CS001";
  String _currentLocation = "Bangalore, India";

  void _saveForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    // Save the form data to a database or other storage mechanism
    // ...

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Profile updated'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  onSaved: (value) => _name = value!,
                ),
                TextFormField(
                  initialValue: _email,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value!,
                ),
                TextFormField(
                  initialValue: _phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                  onSaved: (value) => _phone = value!,
                ),
                TextFormField(
                  initialValue: _yearOfPassing,
                  decoration: const InputDecoration(
                    labelText: 'Year of Passing',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a year of passing';
                    }
                    return null;
                  },
                  onSaved: (value) => _yearOfPassing = value!,
                ),
                TextFormField(
                  initialValue: _branch,
                  decoration: const InputDecoration(
                    labelText: 'Branch',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a branch';
                    }
                    return null;
                  },
                  onSaved: (value) => _branch = value!,
                ),
                TextFormField(
                  initialValue: _usn,
                  decoration: const InputDecoration(
                    labelText: 'USN',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a USN';
                    }
                    return null;
                  },
                  onSaved: (value) => _usn = value!,
                ),
                TextFormField(
                  initialValue: _currentLocation,
                  decoration: const InputDecoration(
                    labelText: 'Current Location',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a current location';
                    }
                    return null;
                  },
                  onSaved: (value) => _currentLocation = value!,
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveForm,
                    child: const Text('Save Profile'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}