import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                color: Colors.blue,
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('lib/images/google.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Patient Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Age: 30',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10.0,
                right: 70.0,
                child: InkWell(
                  onTap: () {
                    // navigate to the edit profile page
                  },
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                right: 20.0,
                child: InkWell(
                  onTap: () {
                    // navigate to the upload files page
                  },
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.file_upload,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: 5, // replace with the actual number of appointments
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Appointment ${index + 1}'),
                    subtitle: Text(
                        'Date: ${DateTime.now().add(Duration(days: index)).toString().substring(0, 10)}'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
