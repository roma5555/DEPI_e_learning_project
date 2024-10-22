import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';



// class DefaultFirebaseOptions {
//   static var currentPlatform;
// }



class UpcomingMeetingsScreen extends StatelessWidget {
  Stream<QuerySnapshot> getMeetings() {
    return FirebaseFirestore.instance.collection('meetings').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Meetings'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getMeetings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No meetings found.'));
          }

          var meetings = snapshot.data!.docs;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: meetings.length,
                  itemBuilder: (context, index) {
                    var meeting = meetings[index];
                    return MeetingCard(
                      title: meeting['title'] ?? 'No Title',
                      date: meeting['date'] ?? 'No Date',
                      time: meeting['time'] ?? 'No Time',
                      location: meeting['location'] ?? 'No Location',
                      link: meeting['link'] ?? '',
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllMeetingsScreen()),
                  );
                },
                child: Text('View All Meetings'),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Forward',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            print("Back button pressed");
          } else if (index == 1) {
            print("Home button pressed");
          } else {
            print("Forward button pressed");
          }
        },
      ),
    );
  }
}

class MeetingCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String location;
  final String link;

  MeetingCard({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(date, style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 4.0),
            Text(time, style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 4.0),
            Text(location, style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                launchURL(link);
              },
              child: Text('Join $location'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class AllMeetingsScreen extends StatelessWidget {
  Stream<QuerySnapshot> getAllMeetings() {
    return FirebaseFirestore.instance.collection('meetings').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Meetings'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getAllMeetings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No meetings found.'));
          }

          var meetings = snapshot.data!.docs;

          return ListView.builder(
            itemCount: meetings.length,
            itemBuilder: (context, index) {
              var meeting = meetings[index];
              return MeetingCard(
                title: meeting['title'] ?? 'No Title',
                date: meeting['date'] ?? 'No Date',
                time: meeting['time'] ?? 'No Time',
                location: meeting['location'] ?? 'No Location',
                link: meeting['link'] ?? '',
              );
            },
          );
        },
      ),
    );
  }
}
