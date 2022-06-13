import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Click me"),
          onPressed: () async {
            var myFuture = Uri.parse('https://example.com');
            http.Response response = await http.get(myFuture);
            if (response.statusCode == 200) {
              print("Success!");
            }
          },
        ),
      ),
    );
  }
}
