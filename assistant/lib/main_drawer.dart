import 'package:assistant/chat/chatpage.dart';
import 'package:assistant/chat/image_generation.dart';
import 'package:assistant/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assistant/about.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: const [
                Icon(
                  Icons.mic,
                  size: 40,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "Assistant",
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.chat_bubble_outline_rounded,
              size: 26,
            ),
            title: const Text(
              'Chat',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatPage()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.image_outlined,
              size: 26,
            ),
            title: const Text(
              'Image Generation',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageGeneration()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              size: 26,
            ),
            title: const Text(
              'About',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              size: 26,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 2),
                  content: const Text('Logged Out Successfully!'),
                  action: SnackBarAction(label: "OK", onPressed: () {}),
                ));
                print("Signed Out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
          ),
        ],
      ),
    );
  }
}
