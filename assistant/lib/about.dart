import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const Text(
            "About",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Center(
              child: Container(
                height: 130,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/PaLM_logo.png'),
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                'PaLM AI',
                style: TextStyle(
                    fontFamily: 'Cera Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Center(
              child: Container(
                height: 130,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/slogo.png'),
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                'Stability AI',
                style: TextStyle(
                    fontFamily: 'Cera Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
