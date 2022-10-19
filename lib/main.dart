// import 'package:c1api/views/example_five.dart';
// import 'package:c1api/views/example_foure.dart';
// import 'package:c1api/views/example_three.dart';
// import 'package:c1api/views/networking.dart';
// import 'package:c1api/views/signup.dart';
import 'package:c1api/provider/count_provider.dart';
import 'package:c1api/provider/slider_provider_one.dart';
import 'package:c1api/views/api_Jtp.dart';
import 'package:c1api/views/example_five.dart';
import 'package:c1api/views/signup.dart';
import 'package:c1api/views/signup1.dart';
import 'package:c1api/views/signup2.dart';
import 'package:c1api/views/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:c1api/views/stetfull.dart';
// import 'package:c1api/views/stless.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'views/count_provider.dart';
// import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProviderOne()),
        // Provider<AnotherThing>(create: (_) => AnotherThing()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:SignUpScreen(),
      ),
    );
    // return MaterialApp(
    //   home: SliderProvider(),
    // );
  }
}
