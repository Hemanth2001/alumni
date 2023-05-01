import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinkedIn'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigate to the search page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=10'),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Software Developer at ABC Company',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16.0),
                      SizedBox(width: 4.0),
                      Text(
                        'Bangalore, India',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Connect with John Doe',
                    style: Theme.of(context).textTheme.button,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 16.0),
      Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          'Create a Post',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 16.0),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
          Row(
          children: [
          CircleAvatar(
          radius: 20.0,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=10'),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 4.0),
                Text(
                  'Software Developer at ABC Company',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          ),
          ],
        ),
        SizedBox(height: 16.0),
        Text(
          'What do you want to talk about?',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey[400]),
        ),
        SizedBox(height: 16.0),
        Container(
        decoration: BoxDecoration(
        border: Border.all(
        color: Colors.grey[300]!,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: TextField(
    minLines: 3,
    maxLines: 10,
    decoration: InputDecoration(
    contentPadding: EdgeInsets.all(16.0),
      border: InputBorder.none,
      hintText: 'Start typing your post...',
    ),
        ),
      ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Post'),
                  ),
                ],
              ),
            ],
        ),
      ),
      ],
    ),
    ),
    SizedBox(height: 16.0),
    Container(
    padding: EdgeInsets.all(16.0),
    color: Colors.white,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Recent Activity',
    style: Theme.of(context).textTheme.headline6,
    ),
    SizedBox(height: 16.0),
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    CircleAvatar(
    radius: 20.0,
    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=10'),
    ),
    SizedBox(width: 16.0),
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Text(
    'John Doe ',
    style: Theme.of(context).textTheme.subtitle1,
    ),
    Text(
    'commented on your post',
    style: Theme.of(context).textTheme.caption,
    ),
    ],
    ),
    SizedBox(height: 4.0),
    Text(
    '2d',
    style: Theme.of(context).textTheme.caption,
    ),
    SizedBox(height: 8.0),
    Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
    color: Colors.grey[100],
    borderRadius: BorderRadius.circular(8.0),
    ),
    child: Text(
    'Great post! Keep up the good work.',
    style: Theme.of(context).textTheme.bodyText2,
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    SizedBox(height: 16.0),
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    CircleAvatar(
    radius: 20.0,
    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=10'),
    ),
    SizedBox(width: 16.0),
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Text(
    'John Doe ',
    style: Theme.of(context).textTheme.subtitle1,
    ),
    Text(
    'liked your post',
    style: Theme.of(context).textTheme.caption,
    ),
    ],
    ),
    SizedBox(height: 4.0),
    Text(
    '3d',
    style: Theme.of(context).textTheme.caption,
    ),
    ],
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    );
  }
}





