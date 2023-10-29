import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:animate_do/animate_do.dart';

class ImageGeneration extends StatefulWidget {
  const ImageGeneration({super.key});

  @override
  State<ImageGeneration> createState() => _ImageGenerationState();
}

class _ImageGenerationState extends State<ImageGeneration> {
  final _textController = TextEditingController();

  late Uint8List _imageData = Uint8List(0);
  bool _isLoading = false;

  void _convertTextToImage() async {
    setState(() {
      _isLoading = true;
    });

    const baseUrl = 'https://api.stability.ai';
    final url = Uri.parse(
        '$baseUrl/v1alpha/generation/stable-diffusion-512-v2-0/text-to-image');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer sk-LVIlcdz9suRM4RKQyBb3OoeB7QMk4LbIVJQAMBGDFZWCdHNH',
        'Accept': 'image/png',
      },
      body: jsonEncode({
        'cfg_scale': 7,
        'clip_guidance_preset': 'FAST_BLUE',
        'height': 512,
        'width': 512,
        'samples': 1,
        'steps': 50,
        'text_prompts': [
          {
            'text': _textController.text ?? '',
            'weight': 1,
          }
        ],
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode != 200) {
      _showErrorDialog('Failed to generate image');
    } else {
      try {
        _imageData = (response.bodyBytes);
        setState(() {});
        _textController.clear();
      } on Exception catch (e) {
        _showErrorDialog('Failed to generate image');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BounceInDown(
            child: const Text(
              "Image-Genetation",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height - 160,
            ),
            if (_imageData != null) Image.memory(_imageData),
            FadeInUp(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              border: GradientBoxBorder(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFF69170),
                                    Color(0xFF7D96E6),
                                  ],
                                ),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "Type to generate image",
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(8.0),
                              ),
                              controller: _textController,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      MaterialButton(
                        onPressed: _convertTextToImage,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFF69170),
                                  Color(0xFF7D96E6),
                                ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 88.0,
                                  minHeight:
                                      36.0), // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.send,
                                color: Colors.white,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
