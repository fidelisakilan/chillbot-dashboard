import 'package:chillbot_dashboard/ui/home.dart';
import 'package:chillbot_dashboard/ui/text_theme.dart';
import 'package:chillbot_dashboard/ui/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Inter Tight", "Spectral");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChillBot',
      theme: theme.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          centerTitle: false,
        ),
      ),
      home: Home(),
    );
  }
}
