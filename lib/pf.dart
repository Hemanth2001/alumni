import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _usnController = TextEditingController();

  String name = "";
  String email = "";
  String phone = "";
  String yearOfPassing = "";
  String branch = "";
  String usn = "";
  String location = "";

  @override
  void initState() {
    super.initState();
    fetchAlumniDetails();
  }

  Future<void> fetchAlumniDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usn = prefs.getString('ID');

    if (usn != null && usn.isNotEmpty) {
      // Retrieve alumni details from Firestore based on USN
      DocumentSnapshot alumniSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(usn).get();

      if (alumniSnapshot.exists) {
        Map<String, dynamic> data =
        alumniSnapshot.data() as Map<String, dynamic>;

        setState(() {
          name = data['name'] ?? "";
          email = data['email'] ?? "";
          phone = data['phone'] ?? "";
          yearOfPassing = data['yearOfPassing'] ?? "";
          branch = data['branch'] ?? "";
          location = data['location'] ?? "";
          this.usn = usn;
          _usnController.text = data['name']  ?? '';

        });
      }
    } else {
      // Handle the case when usn is null or empty
      // You can show an error message or redirect the user to enter their USN again
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Phone: $phone'),
            Text('Year of Passing: $yearOfPassing'),
            Text('Branch: $branch'),
            Text('USN: $usn'),
            Text('Location: $location'),
            TextFormField(
           //   initialValue: name,
              controller: _usnController,
              decoration: const InputDecoration(

                labelText: 'Name',
              ),
             // onSaved: (value) => _name = value!,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _usnController,
                decoration: InputDecoration(
                  labelText: 'USN',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your USN',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
