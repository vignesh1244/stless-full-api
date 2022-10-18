import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() => runApp(MyAppA());

class MyAppA extends StatefulWidget {
  const MyAppA({Key? key}) : super(key: key);

  @override
  _MyAppAState createState() => _MyAppAState();
}

class _MyAppAState extends State<MyAppA> {
  late Future<Post> postr;

  @override
  void initState() {
    super.initState();
    postr = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter REST API Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter REST API Example'),
        ),
        body: Center(
          child: Expanded(
            child: FutureBuilder<Post>(
              future: postr,
              builder: (context, abc) {
                if (abc.hasData) {
                  return Text(abc.data!.title);
                } else if (abc.hasError) {
                  return Text("${abc.error}");
                }

                // By default, it show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<Post> fetchPost() async {
  var client = http.Client();
  // final response = await http.get("");
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    // If the call to the server was successful (returns OK), parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful (response was unexpected), it throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String description;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.description});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      description: json[' description'],
    );
  }
}
