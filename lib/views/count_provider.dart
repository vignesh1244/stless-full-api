import 'dart:async';

import 'package:c1api/provider/count_provider.dart';
import 'package:c1api/views/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderA extends StatefulWidget {
  const ProviderA({Key? key}) : super(key: key);

  @override
  State<ProviderA> createState() => _ProviderAState();
}

class _ProviderAState extends State<ProviderA> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counterProvider = Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      counterProvider.increment();

    });

    
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);


  }

  
  
  
  @override
  Widget build(BuildContext context) {
    print('hi');
    final counterProvider = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Count Provider"))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(
              builder: (context, value, child) {
                print('text is build only');
                return Text(
                  value.count.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SliderProvider()),
              );
            },
            child: Icon(Icons.add),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hello');
          counterProvider.increment();
        },
        child: Icon(Icons.add),
      ),
    );
    ;
  }
}
