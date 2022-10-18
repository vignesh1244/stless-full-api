import 'package:c1api/views/signup2_lite.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupTwo extends StatefulWidget {
  const SignupTwo({Key? key}) : super(key: key);

  @override
  State<SignupTwo> createState() => _SignupTwoState();
}

class _SignupTwoState extends State<SignupTwo> {
  var emailControl = TextEditingController();
  var passControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('signup two'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailControl,
              decoration: InputDecoration(
                labelText: "email",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passControll,
              // obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.password),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton.icon(
              onPressed: () {
                login();
              },
              icon: Icon(
                Icons.login,
                size: 18,
              ),
              label: Text('login'),
            )
          ],
        ),
      ),
    );
  }

  //CREAT FUCTION CALL LOGIN API
  Future<void> login() async {
    if (emailControl.text.isNotEmpty && passControll.text.isNotEmpty) {
      var respose = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {'email': emailControl.text, 'password': passControll.text});

      if (respose.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Second(),));
      }
      else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Credential')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Balack fild not allowd')));
    }
  }
}
