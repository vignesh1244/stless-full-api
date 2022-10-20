// {
// "email": "eve.holt@reqres.in",
// "password": "pistol"
// }

import 'dart:convert';

import 'package:c1api/views/signup2_lite.dart';
import 'package:flutter/material.dart';

// import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController mobileController = TextEditingController();

  // Future<void> login(dynamic mobile) async {
  //   print('hai11');
  //   try {
  //     final response = await http
  //         .post(Uri.https("https://manage.rinzyee.com/api-login"), body: {
  //       "mobile": mobile,
  //     });
  //
  //     print('hai');
  //     final responseJson = json.decode(utf8.decode(response.bodyBytes));
  //
  //     print('hello');
  //     print(response.statusCode);
  //     print('Response body: ${response.statusCode}');
  //
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data);
  //       print('Login successfully');
  //     } else {
  //       print('failedd');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<void> login(mobile) async {
    if (mobileController.text.isNotEmpty) {
      var respose = await http.post(Uri.parse("https://manage.rinzyee.com/api-login"), body: {'mobile': mobileController.text});

      print(respose.statusCode);
      if (respose.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Second(),
            ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credential')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Balack fild not allowd')));
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
                  borderRadius: BorderRadius.circular(10),
                ),
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
