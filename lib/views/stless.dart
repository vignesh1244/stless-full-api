import 'package:flutter/material.dart';

class HomepageP extends StatelessWidget {
  HomepageP({Key? key}) : super(key: key);

  int x = 1;

  @override
  Widget build(BuildContext context) {
    print('builds');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "0",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;
          print(x);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
