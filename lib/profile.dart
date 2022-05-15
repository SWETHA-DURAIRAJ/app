import 'dart:io';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:fss/sizeconfig.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  PickedFile? imageFile = null;
  @override
  Widget build(BuildContext context) {
    final double coverHeight = MediaQuery.of(context).size.height / 3;
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            buildCoverImage(),
            imageProfile()
            /*Positioned(
              bottom: -50.0,
              child: CircleAvatar(
                radius: 80, backgroundColor: Colors.white,
                backgroundImage: AssetImage("img/hand.png"),
                // fit: BoxFit.cover,,))],
              ),
            ),*/
          ],
        ),
      ],
    );
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }

  Widget buildCoverImage() => Container(
        color: Color.fromRGBO(252, 184, 0, 0.5),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3,
      );

  Widget imageProfile() {
    return Stack(children: <Widget>[
      Positioned(
        bottom: 50.0,
        child: CircleAvatar(
            radius: 80.0,
            child: ClipOval(
              child: (imageFile == null)
                  ? Text("Choose Image")
                  : Image.file(File(imageFile!.path)),
            )),
      ),
      Positioned(
        bottom: 20.0,
        right: 20.0,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: ((builder) => bottomSheet()),
            );
          },
          child: Icon(
            Icons.camera_alt,
            color: Colors.teal,
            size: 28.0,
          ),
        ),
      ),
    ]);
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                _openGallery(context);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                _openCamera(context);
                //  takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
}
