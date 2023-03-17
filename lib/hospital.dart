import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HospitalPortalScreen extends StatefulWidget {
  @override
  _HospitalPortalScreenState createState() => _HospitalPortalScreenState();
}

class _HospitalPortalScreenState extends State<HospitalPortalScreen> {
  File? _image;
  final picker = ImagePicker();
  String? _tokenNumber;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _tokenNumber = assignTokenNumber();
      } else {
        print('No image selected.');
      }
    });
  }

  String assignTokenNumber() {
    // assign a unique token number to the user
    // You can use any algorithm to generate a unique token number
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Portal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null ? Text('No image selected.') : Image.file(_image!),
            SizedBox(height: 20),
            _tokenNumber == null
                ? SizedBox()
                : Text('Token Number: $_tokenNumber'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getImage,
              child: Text('Scan Image'),
            ),
          ],
        ),
      ),
    );
  }
}
