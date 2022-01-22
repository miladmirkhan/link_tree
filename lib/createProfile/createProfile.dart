import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:link_tree/Style/style.dart';
import 'package:link_tree/config.dart';
import 'package:link_tree/service/auth_service.dart';
import 'package:provider/provider.dart';

class CreateProfileScreen extends StatefulWidget {
  CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  // image picker
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedProfileImg;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String? _theDlUrl;
  bool _isLoading = false;

  final _formGlobalKey = GlobalKey<FormState>(); // the form key

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _linkedInController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
   final TextEditingController _bioController = TextEditingController();
   final TextEditingController _titleController = TextEditingController();
   final TextEditingController _locationController = TextEditingController();
   final TextEditingController _stackOverFlowController = TextEditingController();
   final TextEditingController _imageUrlController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
  
  //todo we want to save the email address and the UID as well
  @override
  Widget build(BuildContext context) {
    var _authProvider = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Create your profile'),
      ),
      body: _isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              // padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  _selectedProfileImg == null
                      ? Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(color: Colors.blue),
                        )
                      : Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: _selectedProfileImg == null
                                ? Colors.blue
                                : null,
                            image: DecorationImage(
                              image: FileImage(
                                File(_selectedProfileImg!.path),
                              ),
                            ),
                          ),
                        ),
                  ElevatedButton(
                      onPressed: () async {
                        // add image picker package
                        _selectedProfileImg = await _imagePicker.pickImage(
                            source: ImageSource.gallery);

                        // debugPrint("===========>>>" + _selectedProfileImg!.path);
                        setState(() {});
                        // pick an image from the gallery
                      },
                      child: Text('select profile image')),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Form(
                        key: _formGlobalKey,
                        child: ListView(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration:
                                  generalInputDecoration(labelText: 'name'),
                            ),

                            
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _locationController,
                              decoration:
                                  generalInputDecoration(labelText: 'location'),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _titleController,
                              decoration:
                                  generalInputDecoration(labelText: 'title'),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _bioController,
                              decoration:
                                  generalInputDecoration(labelText: 'bio'),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _facebookController,
                              decoration:
                                  generalInputDecoration(labelText: 'facebook'),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _instagramController,
                              decoration:
                                  generalInputDecoration(labelText: 'instagram'),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _stackOverFlowController,
                              decoration:
                                  generalInputDecoration(labelText: 'Stack Over Flow'),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _phoneNumberController,
                              decoration: generalInputDecoration(
                                  labelText: 'phone Number'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'the phone number is required';
                                } else
                                  return null;
                              },
                            ),
                            
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration:
                                  generalInputDecoration(labelText: 'Email'),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _linkedInController,
                              decoration: generalInputDecoration(
                                  labelText: 'Link In'),
                            ),
                            
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _linkedInController,
                              decoration:
                                  generalInputDecoration(labelText: 'Linkedin'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _githubController,
                              decoration:
                                  generalInputDecoration(labelText: 'Github'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                                height: 60,
                                width: 200,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        _isLoading = true;
                                        debugPrint(_isLoading.toString());
                                      });

                                      bool _isValidated = _formGlobalKey
                                          .currentState!
                                          .validate();

                                      if (_isValidated == true &&
                                          _authProvider.theUser != null) {
                                        await uploadTheSelectedFile(
                                            _authProvider.theUser!.uid);
                                        //make our job easier
                                        GeneralUser _generalUser = GeneralUser(
                                          id:_authProvider.generalUser!.id,
                                          name: _authProvider.generalUser!.name,
                                          imageURL: _authProvider.generalUser!.imageURL,
                                          title: _authProvider.generalUser!.title,
                                          location: _authProvider.generalUser!.location,
                                          bio: _authProvider.generalUser!.bio,
                                          github: _authProvider.generalUser!.github,
                                          facebook: _authProvider.generalUser!.facebook ,
                                          instagram: _authProvider.generalUser!.instagram,
                                          linkedIn: _authProvider.generalUser!.linkedIn,
                                          stackOverFlow: _authProvider.generalUser!.stackOverFlow,
                                          phone: _authProvider.generalUser!.phone,
                                          email: _authProvider.generalUser!.email,
                                        );

                                        await FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(_authProvider.generalUser!.id)
                                            .set(_generalUser.toMap(),
                                                SetOptions(merge: true))
                                            .then((value) {
                                          setState(() {
                                            _isLoading = false;
                                            debugPrint(_isLoading.toString());
                                          });
                                          Navigator.pushNamed(context, '/mainScreen');
                                        });
                                       
                                      }
                                    },
                                    child: Text('Create it!')
                                 )
                             ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
    );
  }

  Future<String?> uploadTheSelectedFile(String uid) async {
    //selected image as file
    File _theImageFile = File(_selectedProfileImg!.path);

    //upload the selected image
    await _firebaseStorage
        .ref()
        .child('users/$uid')
        .putFile(_theImageFile)
        .then((p) async {
      _theDlUrl = await p.ref.getDownloadURL();
      debugPrint("dl ======> " + _theDlUrl!);
    });
    return _theDlUrl;
    //todo remove this if for production
    //recieve the downloadURL for the image
  }
}
