import 'package:alumni/invitation_page.dart';
import 'package:alumni/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:alumni/post_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
     if(_selectedIndex==3){
       Navigator.push(
           context, MaterialPageRoute(builder: (context) => AlumniProfilePage()));
     }
      if(_selectedIndex==2){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InvitationPage()));
      }
    });
  }

  final List<Post> _posts = [
    Post(
      name: 'John Doe',
      jobTitle: 'Software Developer at ABC Company',
      location: 'New York, USA',
      imageUrl: 'https://picsum.photos/200/300',
      postText: 'My awesome post',
      imagePostUrl: 'https://picsum.photos/600/400',
      likes: 123,
      comments: 4,
      shares: 7,
    ),
    Post(
      name: 'Jane Smith',
      jobTitle: 'Frontend Developer at XYZ Inc.',
      location: 'San Francisco, USA',
      imageUrl: 'https://picsum.photos/seed/picsum/200/300',
      postText: 'Another great post',
      imagePostUrl: 'https://picsum.photos/seed/picsum/600/400',
      likes: 456,
      comments: 9,
      shares: 12,
    ),
    // add more posts here
  ];

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
                    backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'johndoe@example.com',
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
                Navigator.pop(context);
                // navigate to profile page
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Invitations'),
              onTap: () {
                Navigator.pop(context);
                // navigate to invitations page
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Friends'),
              onTap: () {
                Navigator.pop(context);
                // navigate to friends page
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                // navigate to friends page
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return PostWidget(
            name: post.name,
            jobTitle: post.jobTitle,
            location: post.location,
            imageUrl: post.imageUrl,
            postText: post.postText,
            imagePostUrl: post.imagePostUrl,
            likes: post.likes,
            comments: post.comments,
            shares: post.shares,
          );
        },
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
            icon: Icon(Icons.people),
            label: 'friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Invitations',
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
  final String imagePostUrl;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.name,
    required this.jobTitle,
    required this.location,
    required this.imageUrl,
    required this.postText,
    required this.imagePostUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
