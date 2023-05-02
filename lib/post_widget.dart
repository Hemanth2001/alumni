import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String location;
  final String imageUrl;
  final String postText;
  final String imagePostUrl;
  final int likes;
  final int comments;
  final int shares;

  PostWidget({
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      jobTitle,
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      location,
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption,
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
            postText,
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          ),
          SizedBox(height: 16.0),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Image.network(imagePostUrl, fit: BoxFit.cover),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.thumb_up_alt_outlined, size: 16.0,
                      color: Colors.grey),
                  SizedBox(width: 4.0),
                  Text('$likes', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.chat_bubble_outline, size: 16.0,
                      color: Colors.grey),
                  SizedBox(width: 4.0),
                  Text('$comments', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.share_outlined, size: 16.0, color: Colors.grey),
                  SizedBox(width: 4.0),
                  Text('$shares', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
