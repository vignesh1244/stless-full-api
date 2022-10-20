import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/ImgageModel.dart';
// import '../models/imagemodel.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  Future<ImgageModel> getProductApi() async {
    final response =
        await http.get(Uri.parse("https://webhook.site/e13f83bd-cc8d-4478-abf3-d0949394980b"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ImgageModel.fromJson(data);
    } else {
      return ImgageModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImageModelApi'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ImgageModel>(
                future: getProductApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .3,
                                width: MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        snapshot.data!.data![index].products![index].images!.length,
                                    itemBuilder: (context, position) {
                                      return Container(
                                        height: MediaQuery.of(context).size.height * .25,
                                        width: MediaQuery.of(context).size.width * .5,
                                        child: Image.network(snapshot.data!.data![index]
                                            .products![index].images![position].url
                                            .toString()),
                                        // decoration: BoxDecoration(
                                        //
                                        //   image: DecorationImage(
                                        //     image: NetworkImage(snapshot.data!.data![index].products![position].images![index].url.toString(),),
                                        //   ),
                                        // ),
                                        // child: Text(snapshot.data!.data![index].products![position].images![position].url.toString()),
                                      );
                                    }),
                              ),
                            ],
                          );
                        });
                  } else {
                    return Text('Loding');
                  }
                }),
          ),
        ],
      ),
    );
  }
}
