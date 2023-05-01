import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumni Feed'),
      ),
      body:
      // ListView(
      //   children: [
      //     _buildPost(
      //       context,
      //       profileImage: AssetImage('assets/profile.png'),
      //       name: 'John Doe',
      //       postImage: AssetImage('images/post_image_1.png'),
      //       caption: 'This is a sample post caption',
      //     ),
      //     _buildPost(
      //       context,
      //       profileImage: AssetImage('assets/profile.png'),
      //       name: 'Jane Smith',
      //       postImage: AssetImage('images/post_image_2.png'),
      //       caption: 'Another post caption',
      //     ),
      //   ],
      // ),
      SingleChildScrollView(
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
    ),
    ),
        ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.camera_alt),
                      SizedBox(width: 8.0),
                      Text(
                        'Add Photo/Video',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.blue),
                      ),
                    ],
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
            ],
        ),
      ),
    );
  }
}



  Widget _buildPost(
      BuildContext context, {
        required ImageProvider<Object> profileImage,
        required String name,
        required ImageProvider<Object> postImage,
        required String caption,
      }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.0,
                backgroundImage: profileImage,
              ),
              SizedBox(width: 16.0),
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Image(image: postImage),
          SizedBox(height: 16.0),
          Text(
            caption,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up),
              ),
              Text('12 likes'),
              SizedBox(width: 16.0),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.comment),
              ),
              Text('4 comments'),
            ],
          ),
        ],
      ),
    );
  }

