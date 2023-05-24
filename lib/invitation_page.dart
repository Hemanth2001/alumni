import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class InvitationPage extends StatefulWidget {
  const InvitationPage({Key? key}) : super(key: key);

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invitation'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('invitation').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            final invitations = snapshot.data!.docs;

            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: invitations.length,
                itemBuilder: (context, index) {
                  final invitation = invitations[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('images/profile_image.jpg'),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                invitation['event_name'],
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Invitation from ${invitation['event_location']}',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Image.network(
                        invitation['image_url'],
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Are you joining us?'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
