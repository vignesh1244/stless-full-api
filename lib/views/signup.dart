// {
// "email": "eve.holt@reqres.in",
// "password": "pistol"
// }

import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController mobileController = TextEditingController();

  // List<Loginn> userList = [];

  void login(dynamic mobile) async {
    try {
      // Response response =
      //     await post(Uri.parse('http://manage.rinzyee.com/api-login'),
      //         body: {
      //   'mobile': mobile,
      // });


      final response = await http.post(Uri.parse('http://manage.rinzyee.com/api-login'), body: {
        'mobile': mobile,
      });
      final responseJson = json.decode(utf8.decode(response.bodyBytes));

       print(response.statusCode);
      print('Response body: ${response.statusCode}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Login successfully');
      } else {
        print('failedd');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: mobileController,
              decoration: InputDecoration(hintText: 'mobile'),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                login(mobileController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),),
                child: Center(
                  child: Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

