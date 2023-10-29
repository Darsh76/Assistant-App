import 'package:assistant/chat/gradient_text.dart';
import 'dart:ui';
// import 'package:assistant/chat_page.dart';
import 'package:assistant/chat/chatpage.dart';
import 'package:assistant/chat/image_generation.dart';
import 'package:assistant/chat/image_generation.dart';
import 'package:assistant/feature_box.dart';
import 'package:assistant/main_drawer.dart';
import 'package:assistant/pallete.dart';
import 'package:animate_do/animate_do.dart';
// import 'package:assistant/chat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const Text(
            "Assistant",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ZoomIn(
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: const BoxDecoration(
                            // color: Pallete.assistantCircleColor,
                            color: Color.fromRGBO(102, 157, 209, 0.553),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Container(
                        height: 123,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/virtualAssistant.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 100),
                  child: Card(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              //get colors from hex
                              Color(0xFFF69170),
                              Color(0xFF7D96E6),
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 16.0, left: 16.0),
                                child: (Text("Hi! You Can Ask Me",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: (Text("Anything",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 16.0, bottom: 16.0),
                                child: (TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ChatPage(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: GradientText(
                                        "Ask Now",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFF69170),
                                          Color(0xFF7D96E6),
                                        ]),
                                      ),
                                    ))),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/logo.png",
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: SizedBox(
                                height: 150,
                                width: 150,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  // duration: const Duration(milliseconds: 200),
                  child: Card(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              //get colors from hex
                              Color(0xFF7D96E6),
                              Color(0xFFF69170),
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/logo.png",
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: SizedBox(
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 16.0, left: 16.0),
                                child: (Text("Generate Any",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: (Text("Pictures",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 16.0, bottom: 16.0),
                                child: (TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ImageGeneration(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: GradientText(
                                        "Generate Now",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFF69170),
                                          Color(0xFF7D96E6),
                                        ]),
                                      ),
                                    ))),
                              ),
                            ],
                          ),
                          // const Padding(
                          //   padding: EdgeInsets.only(left: 16.0),
                          //   child: DecoratedBox(
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //           image: AssetImage(
                          //             "assets/images/logo.png",
                          //           ),
                          //           fit: BoxFit.cover),
                          //     ),
                          //     child: SizedBox(
                          //       height: 150,
                          //       width: 150,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                SlideInLeft(
                  delay: const Duration(milliseconds: 200),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Text(
                      "Services We Provide",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SlideInLeft(
                  delay: const Duration(milliseconds: 300),
                  child: Card(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              //get colors from hex
                              Color(0xFF7D96E6),
                              Color(0xFFF69170),
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 20.0).copyWith(
                          left: 15,
                        ),
                        child: Column(
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "PaLM AI",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Text(
                                "A smarter way to stay organized and informed with PaLM AI (Google AI).",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SlideInRight(
                  delay: const Duration(milliseconds: 400),
                  child: Card(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              //get colors from hex
                              Color(0xFFF69170),
                              Color(0xFF7D96E6),
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 20.0).copyWith(
                          left: 10,
                        ),
                        child: Column(
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Stability AI",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Text(
                                "Get inspired and stay creative with your personal assistant powered by Stability",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
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
