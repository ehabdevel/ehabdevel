import 'package:flutter/material.dart';
import './aboutapp_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

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
                color: Colors.red,
              ),
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
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Expanded(child: MessagesStream()),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
          ],
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
        children: const [
          ListTile(
            leading: CircleAvatar(),
            title: Text('John Doe'),
            subtitle: Text('Hello'),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text('John Doe'),
            subtitle: Text('Hello'),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text('John Doe'),
            subtitle: Text('Hello'),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text('John Doe'),
            subtitle: Text('Hello'),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text('John Doe'),
            subtitle: Text('Hello'),
          ),
        ],
      ),
    );
  }
}
