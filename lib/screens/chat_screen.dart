import 'package:flutter/material.dart';
import './main_screen.dart';
import 'about_app_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    // required int peerId,
    // required String peerAvatar
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              child: Center(
                child: Text(
                  'SOSBlood',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
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
                    builder: (context) => const MainScreen(),
                  ),
                );
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
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Expanded(child: MessagesStream()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Type a message...',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        // send message
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          Card(
            color: Color(0xFFEEEEEE),
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 50),
              title: Text('John Doe'),
              subtitle: Text('Hello!'),
            ),
          ),
          Card(
            color: Color(0xFF80CBC4),
            child: ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.account_circle, size: 50),
              title: Text('John Doe'),
              subtitle: Text('Hello!'),
            ),
          ),
          Card(
            color: Color(0xFFEEEEEE),
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 50),
              title: Text('John Doe'),
              subtitle: Text('Hello!'),
            ),
          ),
          Card(
            color: Color(0xFF80CBC4),
            child: ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.account_circle, size: 50),
              title: Text('John Doe'),
              subtitle: Text('Hello!'),
            ),
          ),
          Card(
            color: Color(0xFFEEEEEE),
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 50),
              title: Text('John Doe'),
              subtitle: Text('Hello!'),
            ),
          ),
          Card(
            color: Color(0xFF80CBC4),
            child: ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.account_circle, size: 50),
              title: Text('John Doe'),
              subtitle: Text('Hello!'),
            ),
          ),
          Card(
            color: Color(0xFFEEEEEE),
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 50),
              title: Text('John Doe'),
              subtitle: Text('Hello!'),
            ),
          ),
        ],
      ),
    );
  }
}
