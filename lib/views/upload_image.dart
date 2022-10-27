import 'dart:io';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final _picker = ImagePicker();
  bool showspinner = false;

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('no image selecter');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showspinner = true;
    });

    var stream = new https.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = new https.MultipartRequest('POST', uri);
    request.fields['title'] = "static title";
    var multport = new https.MultipartFile('image', stream, length);
    request.files.add(multport);
    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        showspinner = false;
      });
      print('image uploaded');
    } else {
      setState(() {
        showspinner = false;
      });
      print('image faild to uploaded');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Upload Images'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                  child: image == null
                      ? Center(
                          child: Text('pick image'),
                        )
                      : Container(
                          child: Center(
                            child: Image.file(
                              File(image!.path).absolute,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 100,
                color: Colors.green,
                child: Center(child: Text('upload image')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
