import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            shrinkWrap: true,
            children: const [
              ListTile(
                title: Text(
                  'The problem we are trying to solve',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  'It is not something surprising that the blood transfusions centers all over the world are suffering from a lack of stock. and with the pandemic the situation has become even worse and delicate.',
                ),
              ),
              ListTile(
                title: Text(
                  'Before the blood stock in a lot of countries allows in these best cases to cover the needs of 15 days of consumption. Nevertheless, with the covid19 it barely arrives at a stock of 24 hours. the situation is therefore become critical and terrible !! And it is more or less almost the same situation everywhere in the world. The same for a person with a rare blood type it is even worse if he ever has  something bad happens suddenly,  probably he will lose his life if he doesnt know a person who have the same sangauin type.',
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'The solution',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                    '1- Allow the users to announce the needed blood type, when ever they need to. And so can the other users see them.'),
              ),
              ListTile(
                title: Text(
                    '2- Provide a way of communication between those who needs blood, especially the rare types, with those who wants to donate blood.'),
              ),
              ListTile(
                title: Text(
                    '3- A section of social advice and documentation on donating blood to raise awareness and support demanders and donors.'),
              ),
              ListTile(
                title: Text(
                    '4- Our application will send a reminder message to the donors after 3 months to remind them of the possibility of donating blood.'),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'The Impact',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'The impact of our app on society is achieved by helping people when they are weak, minimizing donor search time, and most importantly, saving lives.',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
