import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

var loggedInUserEmail;
var loggedInUser;
var userID;
var imageUrl;

class addFood extends StatefulWidget {
  const addFood({Key? key}) : super(key: key);
  @override
  State<addFood> createState() => _addFoodState();
}

class _addFoodState extends State<addFood> {
  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
  }

  File? imageFile;
  String foodCategory = 'Fast Food';
  String ? title;
  String ? description;
  String ? price;

  final ImagePicker picker = ImagePicker();
  final Reference storageReference = FirebaseStorage.instance.ref();

  ///image uoload function
  Future<void> uploadImageToFirebase() async {
    ///file upload code
    if (imageFile != null) {
      try {
        final dateTime = DateTime.now();
        final imageName = 'food_${dateTime.millisecondsSinceEpoch}.png';
        final Reference imageRef = storageReference
            .child('Vendor/$loggedInUserEmail/food_images/$imageName');
        await imageRef.putFile(imageFile!);
        imageUrl = await imageRef.getDownloadURL();
        return imageUrl;
        // You can now use 'imageUrl' to store the image URL in your database or use it as needed.
      } catch (e) {
        // Handle errors if the upload fails.
        Text('Error: $e');
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Food'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              width: 300,
              child: imageFile != null
                  ? Image.file(
                      imageFile!,
                      fit: BoxFit.cover,
                    )
                  : const Center(
                      child: Text(
                      'Please select the image',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )), // Display a message if imageFile is null
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    XFile? pickedFile = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                      maxWidth: 300,
                      maxHeight: 300,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        imageFile = File(pickedFile.path);
                      });
                    }
                  },
                  child: const Text('Select Image'),
                ),
                const SizedBox(
                  width: 10,
                ),
                DropdownButton(
                  value: foodCategory,
                  items: const [
                    DropdownMenuItem<String>(value: 'Fast Food',child: Text('Fast Food'),),
                    DropdownMenuItem<String>(value: 'Beverages',child: Text('Beverages'),),
                    DropdownMenuItem<String>(value: 'Home Food',child: Text('Home Food'),),
                  ],
                  onChanged: (String ? newValue) {
                    setState(() {
                      foodCategory = newValue!;
                    });
                  },
                ),

              ],
            ),
            //TextButton(onPressed: (){ print(_value);}, child: Text('print type'),),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLength: 100,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Title',
              ),
              onChanged: (value){
                title = value;
              },
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              minLines: 1,
              maxLines: 50,
              maxLength: 500,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a Description (500 word, 50 lines)',
              ),
              onChanged: (value){
                description = value;
              },
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              minLines: 1,
              maxLines: 1,
              maxLength: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Price',
              ),
              onChanged: (value){
                price = value;
              },
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  uploadImageToFirebase();
                  uploadFoodData(title!, description!, foodCategory!, price!, imageUrl!);
                },
                child: const Text('Publish')),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

///THIS FUNCTION WILL GET THE CURRENT USER FROM DATABASE

void getCurrentUser() async {
  try {
    final user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      var loggedInUser = user;
      loggedInUserEmail = loggedInUser.email;
      userID = loggedInUser.uid;
    }
  } catch (e) {
    print(e);
  }
}

/// THIS FUNCTION WILL UPLOAD THE FOOD DATA TO THE FIRESTORE DATABASE

void uploadFoodData(String title, description, category, price, imageUrl) async {
  await FirebaseFirestore.instance
      .collection('Vendor')
      .doc(userID)
      .collection('Listings')
      .doc(title)
      .set({
    'title': title,
    'description': description,
    'category':category,
    'price': price,
    'imageUrl': imageUrl,
    'vendorID': userID,
  });
}
