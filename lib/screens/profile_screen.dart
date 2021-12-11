import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'about_app_screen.dart';
import 'chat_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                    child: Text(
                  'SOSBlood App',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                },
              ),
              ListTile(
                title: const Text('About App'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutAppScreen()));
                },
              ),
              ListTile(
                title: const Text('Chat'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen(
                              // peerId: 0,
                              // peerAvatar: '',
                              )));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  // backgroundImage: NetworkImage(
                  //   'https://picsum.photos/250?image=9',
                  // ),
                  backgroundColor: Colors.teal,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Profile Name'),
                const SizedBox(height: 10),
                TextButton(
                  child: const Text('Logout'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: const [
                          ListTile(
                            title: Text('Name:'),
                            subtitle: Text('John Doe'),
                          ),
                          ListTile(
                            title: Text('Email:'),
                            subtitle: Text('email@mail.com'),
                          ),
                          ListTile(
                            title: Text('Phone:'),
                            subtitle: Text('+91 1234567890'),
                          ),
                          ListTile(
                            title: Text('Address:'),
                            subtitle: Text('Address'),
                          ),
                          ListTile(
                            title: Text('Blood Group:'),
                            subtitle: Text('A+'),
                          ),
                          ListTile(
                            title: Text('Last Donated:'),
                            subtitle: Text('12/12/2020'),
                          ),
                          ListTile(
                            title: Text('About me:'),
                            subtitle: Text(
                                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
