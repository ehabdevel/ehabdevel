import 'package:flutter/material.dart';
// import './screens/chat_screen.dart';
import 'welcome_screen.dart';

// import './screens/login_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SOSBlood());
}

class SOSBlood extends StatelessWidget {
  const SOSBlood({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SOSBlood',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            primary: Colors.teal,
            // primary: const Color(0xFF00897B),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ))),
      home: const WelcomeScreen(),
    );
  }
}
