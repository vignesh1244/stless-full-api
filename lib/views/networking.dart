import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///////////////////////////////////////////////////////////////////////

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {

    // If the server did return a 200 OK response,
    // then parse the JSON.
    return  Album.fromJson(jsonDecode(response.body));

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
// Future<List<Album>> fetchAlbum() async {
//   final response =
//   await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
//   var data = jsonDecode(response.body.toString());
//   if (response.statusCode == 200) {
//     for (Map i in data) {
//       print(i['name']);
//       userList.add(Album.fromJson(i));
//     }
//     return userList;
//   } else {
//     return userList;
//   }
// }
/////////////////////////////////////////////////////////////////

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
////////////////////////////////////////////////////////////////////

// void main() => runApp( MyAppA());

class MyAppA extends StatefulWidget {
  // const MyApp({super.key});

  @override
  State<MyAppA> createState() => _MyAppAState();
}

class _MyAppAState extends State<MyAppA> {
  late Future<Album> futureAlbum;



  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum() as Future<Album>;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {


                    return  Text(snapshot.data!.title);

             
                // return ListView.builder(
                //     itemCount: userList.length,
                //     itemBuilder: (context, index) {
                //       return Card(
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Column(
                //             children: [
                //               ReusbaleRow(
                //                   title: 'Name',
                //                   value:
                //                   snapshot.data![index].title.toString()),
                //               ReusbaleRow(
                //                   title: 'username',
                //                   value: snapshot.data![index].username
                //                       .toString()),
                //
                //             ],
                //           ),
                //         ),
                //       );
                //     });


              }



              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}




class ReusbaleRow extends StatelessWidget {
  String title, value;

  ReusbaleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
