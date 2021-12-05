import 'package:flutter/material.dart';
import 'demandeur.dart';
import 'donateur.dart';
import 'profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text('Bienvenue',
                            textScaleFactor: 2.5,
                            style: TextStyle(
                                color: Colors.blueGrey,
                                // fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto')),
                      ),
                      Expanded(
                        flex: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.teal.shade800,
                            // child: const Text('EH'),
                            // backgroundImage: AssetImage('assets/logo.png'),
                            child: const Icon(
                              // Icons.person,
                              Icons.account_circle,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            // icon: const Icon(Icons.search),
                            hintText: 'Rechercher',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(0xFFECEFF1),
                                width: 1,
                              ),
                            ),
                            fillColor: const Color(0xFFECEFF1),
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: TabBar(
                          tabs: [
                            Tab(
                              // text: 'Demandeur',
                              child: Text(
                                'Donateur',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            Tab(
                              // text: 'Donateur',
                              child: Text(
                                'Demandeur',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                          automaticIndicatorColorAdjustment: true,
                          indicatorColor: Colors.teal,
                          indicatorWeight: 2,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Donateur(),
                        Demandeur(),
                      ],
                    ),
                  ),
                  // Scaffold(
                  //   appBar: AppBar(
                  //     title: const Text('Bienvenue',
                  //         style: TextStyle(color: Colors.blueGrey)),
                  //     actions: [
                  //       CircleAvatar(
                  //         backgroundColor: Colors.brown.shade800,
                  //         child: const Text('EH'),
                  //       ),
                  //     ],
                  //     backgroundColor: Colors.white,
                  //     bottom: const TabBar(
                  //       tabs: <Widget>[
                  //         Tab(text: 'Donateur'),
                  //         Tab(text: 'Demandeur'),
                  //       ],
                  //       automaticIndicatorColorAdjustment: true,
                  //       indicatorColor: Colors.teal,
                  //       indicatorWeight: 3,
                  //       indicatorSize: TabBarIndicatorSize.label,
                  //       labelColor: Colors.teal,
                  //     ),
                  //   ),
                  //   body: const TabBarView(
                  //     children: <Widget>[
                  //       Center(child: Donateur()),
                  //       Center(child: Demandeur()),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
