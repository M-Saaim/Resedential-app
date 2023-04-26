// ignore_for_file: unused_import, library_prefixes, depend_on_referenced_packages, avoid_print

import 'dart:math';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/admin/adhome.dart';
import 'package:resedentialapp/screen/admin/adnotice.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';

class Addnotice extends StatefulWidget {
  const Addnotice({Key? key}) : super(key: key);

  @override
  State<Addnotice> createState() => _AddnoticeState();
}

class _AddnoticeState extends State<Addnotice> {
  /// Variables
  File? _imageFile;
  late String notice;
  late String userid;
  late String email;
  final now = DateTime.now();

  @override
  void initState() {
    final auth = FirebaseAuth.instance;
    dynamic user = auth.currentUser;
    email = user.email;
    userid = user.uid;

    super.initState();
  }

  get textStyle => const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

//   Future chooseFile() async {
//     await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
//     setState(() {
//       _image = image as File?;
//     });
//   });
// }

  // Future uploadFile() async {
  //   var storageReference = FirebaseStorage.instance
  //       .ref()
  //       .child('notice/${Path.basename(imageFile!.path)}}');
  //   var uploadTask = storageReference.putFile(imageFile!);
  //   await uploadTask.whenComplete(() => null);
  //   print('File Uploaded');
  //   storageReference.getDownloadURL().then((fileURL) {
  //     setState(() {
  //       _uploadedFileURL = fileURL;
  //     });
  //   });
  // }
  uploadImage(img) async {
    print(_imageFile);
    // Initialize Firebase once again
    await Firebase.initializeApp();
    var random = Random();
    var rand = random.nextInt(1000000000);
    // Give the image a random name
    String name = "image:$rand";
    try {
      //   StorageReference firebaseStorageRef =
      //     FirebaseStorage.instance.ref().child('uploads/$name');
      // StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
      // StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      await firebase_storage.FirebaseStorage.instance
          // Give the image a name
          .ref()
          .child('uploads/$name');
      // Upload image to firebase
      // .putFile(img);
      print("Uploaded image");
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Adnotice()));
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
              title: const Text("Add-Notice"),
              backgroundColor: const Color.fromARGB(255, 170, 37, 0),
              centerTitle: true,
            ),
            body: Builder(builder: (context) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 1.5,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(children: [
                        TextField(
                          keyboardType: TextInputType.multiline,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            notice = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hoverColor:
                                const Color.fromRGBO(97, 167, 238, 0.684),
                            fillColor: Colors.black12,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(9)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple.shade400,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(9)),
                            hintText: 'Notice',
                            alignLabelWithHint: true,
                            label: const Icon(
                              Icons.event_note,
                              color: Color.fromARGB(255, 170, 0, 0),
                            ),
                          ),
                          maxLines: 5,
                          minLines: 1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MaterialButton(
                                    color: Colors.blue,
                                    child: const Text("Pick Image from Gallery",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      _getFromGallery();
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                MaterialButton(
                                    color: Colors.blue,
                                    child: const Text("Pick Image from Camera",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      _getFromCamera();
                                    }),
                              ],
                            ),
                          ],
                        ),
                        _imageFile == null
                            ? Container()
                            : Image.file(File(_imageFile!.path)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            uploadImage(_imageFile);
                            Map<String, dynamic> datatoSave = {
                              'Notice': notice,
                              'userUid': userid,
                              'timestamp': now,
                              'Image': _imageFile,
                            };

                            FirebaseFirestore.instance
                                .collection('Notice')
                                .doc(email)
                                .set(datatoSave);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Adnotice()));
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15.0),
                              backgroundColor:
                                  const Color.fromARGB(255, 170, 0, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          child: Column(
                            children: [
                              Text(
                                "Update",
                                style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        letterSpacing: 1.3,
                                        fontWeight: FontWeight.w800)),
                              ),
                              Text(
                                "Notice",
                                style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        letterSpacing: 1.3,
                                        fontWeight: FontWeight.w800)),
                              ),
                            ],
                          ),
                        ),
                      ])),
                ),
              );
            })));
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
}
