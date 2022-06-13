import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final ImagePicker _picker = ImagePicker();
  File picture = File("");
  Random random = Random();
  List assets = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
  ];

  File? imageFile;
  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Please choose an option"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    _getFromCamera();
                  },
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.camera,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        "GAllery",
                        style: TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    // Shadow for top-left corner
                    BoxShadow(
                      color: Colors.grey[500]!,
                      offset: const Offset(5, 5),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                    // Shadow for bottom-right corner
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, -5),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ]),
              child: picture.path != ""
                  ? Image.file(
                      picture,
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          TextButton(
            onPressed: () async {
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);

              final XFile? photo =
                  await _picker.pickImage(source: ImageSource.camera);
              setState(() {
                picture = File(image!.path);
              });
            },
            child: const Text(
              "Plastikni orqa fonini almashtirish",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          //!

          //!

          Text("Opaycity, Blur"),
          Container(
            width: double.maxFinite,
            child: CupertinoSlider(
              min: 0.0,
              max: 100.0,
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ),
          Text("Kartani orqa foni uchun rasmlar"),
          SizedBox(
            height: 210,
            width:370 ,
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: assets.length,
              itemBuilder: (BuildContext context, int index) { 
                return  Container(
                height: 200,
                width: 370,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                 
                  image: DecorationImage(
                    image: AssetImage(assets[index]),
                  ),
                ),
              );
               },
             
            ),
          ),
        ],
      ),
    );
  }

  String img() {
    int min = 0;
    int max = assets.length - 1;
    random = Random();
    int r = min + random.nextInt(max - min);
    String imageName = assets[r].toString();
    return imageName;
  }

  double _value = 10;

  void _getFromCamera() async {}
}
