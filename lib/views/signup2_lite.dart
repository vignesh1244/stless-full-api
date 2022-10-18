import 'package:c1api/views/signup2.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("welcome user"),
            SizedBox(
              height: 50,
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignupTwo(),));
              },
              icon: Icon(Icons.exit_to_app),
              label: Text('exit'),
            )
          ],
        ),
      ),
    );
  }
}
