import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:core';

class AlumniProfilePage extends StatefulWidget {
  const AlumniProfilePage({Key? key}) : super(key: key);

  @override
  _AlumniProfilePageState createState() => _AlumniProfilePageState();
}

class _AlumniProfilePageState extends State<AlumniProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _name= TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _yearOfPassing = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _branch = TextEditingController();
  TextEditingController _usn = TextEditingController();
  TextEditingController _currentLocation = TextEditingController();




  void _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedUsn = prefs.getString('ID') ?? '';

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(savedUsn)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        setState(() {
          _name = TextEditingController(text: data['name'] ?? '');
          _email = TextEditingController(text: data['email'] ?? '');
          _phone = TextEditingController(text: data['mobile']?.toString() ?? '');
          _yearOfPassing = TextEditingController(text: data['year']?.toString() ?? '');
          _branch = TextEditingController(text: data['profession'] ?? '');
          _usn = TextEditingController(text: data['usn'] ?? '');
          _currentLocation = TextEditingController(text: data['location'] ?? '');
        });
      }
    } else {
      // Handle the case when the document is not found
      print('Document not found');
    }
  }





  void _saveForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    // Update the form data in Firestore
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedUsn = prefs.getString('ID') ?? '';

    await FirebaseFirestore.instance
        .collection('users')
        .doc(savedUsn)
        .update({
      'name': _name.text,
      'email': _email.text,
      'mobile': _phone.text,
      'year': int.parse(_yearOfPassing.text),
      'profession': _branch.text,
      'usn': _usn.text,
      'location': _currentLocation.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Profile updated'),
        duration: const Duration(seconds: 2),
      ),
    );
  }


  @override
  void initState() {
   _getUserData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Profile'),
        backgroundColor: Colors.blueGrey,
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
                    backgroundImage: AssetImage('images/profile_image.jpg'),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(

                    labelText: 'Name',
                  ),
                  onSaved: (value) => _name = value! as TextEditingController,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value! as TextEditingController,
                ),
                TextFormField(
                  controller: _phone,
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
                  onSaved: (value) => _phone = value! as TextEditingController,
                ),
                TextFormField(
                  controller: _yearOfPassing,
                  decoration: const InputDecoration(
                    labelText: 'Year of Passing',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your year of passing';
                    }
                    return null;
                  },
                  onSaved: (value) => _yearOfPassing = value! as TextEditingController,
                ),
                TextFormField(
                  controller: _branch,
                  decoration: const InputDecoration(
                    labelText: 'Profession',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your branch';
                    }
                    return null;
                  },
                  onSaved: (value) => _branch = value! as TextEditingController,
                ),
                TextFormField(
                  controller: _usn,
                  decoration: const InputDecoration(
                    labelText: 'USN',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your USN';
                    }
                    return null;
                  },
                  onSaved: (value) => _usn = value! as TextEditingController,
                ),
                TextFormField(
                  controller: _currentLocation,
                  decoration: const InputDecoration(
                    labelText: 'Current Location',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current location';
                    }
                    return null;
                  },
                  onSaved: (value) => _currentLocation = value! as TextEditingController,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _saveForm,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
