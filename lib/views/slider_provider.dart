import 'package:c1api/provider/slider_provider_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count_provider.dart';

class SliderProvider extends StatefulWidget {
  const SliderProvider({Key? key}) : super(key: key);

  @override
  State<SliderProvider> createState() => _SliderProviderState();
}

class _SliderProviderState extends State<SliderProvider> {
  // double value=1.0;
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SliderProviderOne>(context, listen: false);
    print('all');
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider_provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProviderOne>(
            builder: (context, value, child) {
              return Slider(
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);
                  });
            },
          ),
          Consumer<SliderProviderOne>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value)),
                      child: Text('contai1'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value)),
                      child: Text('contai1'),
                    ),
                  )
                ],
              );
            },
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProviderA()),
              );
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
