import 'package:alumni/invitation_page.dart';
import 'package:alumni/login_screen.dart';
import 'package:alumni/user_profile.dart';
import 'package:alumni/linkedin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:alumni/post_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _name="";
  String _email="";

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('isLoggedIn', 0);
    prefs.setString('ID', "");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
     if(_selectedIndex==3){
       Navigator.push(
           context, MaterialPageRoute(builder: (context) => AlumniProfilePage()));
     }
      if(_selectedIndex==1){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InvitationPage()));
        //InvitationPage()
      }
      if(_selectedIndex==2){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OnHoldPage()));
        //InvitationPage()
      }
    });
  }
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
          _name = data['name'] ?? '';
          _email = data['email'] ?? '';
        });
      }
    } else {
      // Handle the case when the document is not found
      print('Document not found');
    }
  }
  void initState() {
    _getUserData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SVCE Alumni'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],

      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/profile_image.jpg'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AlumniProfilePage()));

              },
            ),
            ListTile(
              leading: Icon(Icons.inventory_2_outlined),
              title: Text('Invitations'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => InvitationPage()));

                // navigate to invitations page
              },
            ),
            ListTile(
              leading: Icon(Icons.line_weight_outlined),
              title: Text('LinkedIn'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => OnHoldPage()));
                // navigate to friends page
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                logout();
                // navigate to friends page
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      final documents = snapshot.data!.docs;

      return ListView.builder(
        itemCount: documents.length,
        itemBuilder: (context, index) {
          final document = documents[index];
          final data = document.data() as Map<String, dynamic>;

          return PostWidget(
            name: data['name'],
            jobTitle: data['jobTitle'],
            location: data['location'],
            imageUrl: data['imageUrl'],
            postText: data['postText'],
            likes: data['likes'],
            comments: data['comments'],
            shares: data['shares'],
          );
        },
      );
    }
    ),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: 'Invitation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_weight_outlined),
            label: 'LinkedIn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],


      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      ),
    );
  }
}

class Post {
  final String name;
  final String jobTitle;
  final String location;
  final String imageUrl;
  final String postText;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.name,
    required this.jobTitle,
    required this.location,
    required this.imageUrl,
    required this.postText,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
