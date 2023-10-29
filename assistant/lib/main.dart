// import 'package:assistant/home_page.dart';
import 'package:assistant/about.dart';
import 'package:assistant/chat/image_generation.dart';
import 'package:assistant/pallete.dart';
import 'package:assistant/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:assistant/chat/homepage.dart';
import 'package:assistant/chat/chatpage.dart';
import 'dart:ui';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 138, 182, 233));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chat Bot',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
//         useMaterial3: true,
//       ),
//       // initialRoute: HomePage.routeName,
//       // routes: {
//       //   HomePage.routeName: (context) => const HomePage(),
//       //   ChatPage.routeName: (context) => const ChatPage(),
//       // },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Assistant',
        theme: ThemeData.light(useMaterial3: true).copyWith(
          colorScheme: kColorScheme,
          scaffoldBackgroundColor: Pallete.whiteColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: Pallete.whiteColor,
              foregroundColor: Pallete.blackColor),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 24,
                  fontFamily: 'Cera Pro')),
        ),
        home: const SignInScreen());
  }
}
