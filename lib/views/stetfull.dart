import 'package:flutter/material.dart';

class Stfull extends StatefulWidget {
  const Stfull({Key? key}) : super(key: key);

  @override
  State<Stfull> createState() => _StfullState();
}

class _StfullState extends State<Stfull> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("helo");
    return Scaffold(
      appBar: AppBar(title: Text("Stetfull")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              count.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          )
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () {
          count++;
          print(count);
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
