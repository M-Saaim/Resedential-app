// ignore_for_file: unused_import

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  late String notice;
  late String userid;
  late String email;
  final now = DateTime.now();
  File? _image;
  String? _uploadedFileURL;

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

//   Future uploadFile() async {
//   StorageReference storageReference = FirebaseStorage.instance
//       .ref()
//       .child('notice/${Path.basename(_image!.path)}}');
//    StorageUploadTask uploadTask = storageReference.putFile(_image);
//    await uploadTask.onComplete;
//    print('File Uploaded');
//    storageReference.getDownloadURL().then((fileURL) {
//      setState(() {
//        _uploadedFileURL = fileURL;
//      });
//    });
//  }

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
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Container(
                    height: MediaQuery.of(context).size.height,
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
                          hoverColor: const Color.fromRGBO(97, 167, 238, 0.684),
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
                      // Container(
                      //   child: ButtonBar(
                      //     children: <Widget>[
                      //       const Text('Selected Image'),
                      //       _image != null
                      //           ? Image.asset(
                      //             _image!.path,
                      //             height: 150,
                      //             )
                      //           : Container(height: 150),
                      //       _image == null
                      //           ? RaisedButton(
                      //             child: Text('Choose File'),
                      //             onPressed: chooseFile,
                      //             color: Colors.cyan,
                      //             )
                      //           : Container(),
                      //       _image != null
                      //           ? RaisedButton(
                      //             child: Text('Upload File'),
                      //             onPressed: uploadFile,
                      //             color: Colors.cyan,
                      //             )
                      //             : Container(),
                      //       _image != null
                      //             ? RaisedButton(
                      //               child: Text('Clear Selection'),
                      //               onPressed: clearSelection,
                      //               )
                      //               : Container(),
                      //       Text('Uploaded Image'),
                      //               _uploadedFileURL != null
                      //               ? Image.network(
                      //                 _uploadedFileURL!,
                      //                 height: 150,
                      //                 )
                      //                 : Container(),
                      //                 ],
                      //           ),
                      //           // if (this._imageFile == null){const Placeholder()}

                      //           // else{Image.file(this._imageFile!)}

                      //           ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> datatoSave = {
                            'Notice': notice,
                            'user uid': userid,
                            'timestamp': now,
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
              );
            })));
  }
  // Future<void> _pickImageFromGallery() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() => this._imageFile = File(pickedFile.path));
  //   }
  // }

  // Future<void> _pickImageFromCamera() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.camera);
  //   if (pickedFile != null) {
  //     setState(() => this._imageFile = File(pickedFile.path));
  //   }
  // }
}
