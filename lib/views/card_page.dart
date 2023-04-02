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




  File? imageFile;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
     
        children: [
          SizedBox(
                  height: 30,
                ),
          GestureDetector(
            onTap: () async {}, 
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: DecorationImage(image: picture.path != null
                  ? FileImage(
                      picture as File,
                   
                    )
                  :  AssetImage("assets/images/1.jpg" , )  as ImageProvider, fit: BoxFit.cover) ,
                  borderRadius: BorderRadius.circular(15),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset("assets/images/chip.png", height: 150, width: 150,), 
                      Text(" 9860  1801 0346  1183", style: TextStyle(fontSize: 33, ),), 
                       Text("12/27", textAlign: TextAlign.center) , 
                        Text("Sattorov Sardor", textAlign: TextAlign.left)
                    ],
                  ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);

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
        

          
         
        
        ],
      ),
    );
  }




 
}
