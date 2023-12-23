import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class myProfile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  File ? imageFile;
  final ImagePicker  picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'My Profile'
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('assets/main.jpg'),
                ),
                ElevatedButton(onPressed: (){}, child: const Text('Upload Profile Picture')),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _textController,
                  validator: (val){
                    if (val!.isEmpty){
                      return "Enter store Name";
                    }
                  },
                  decoration: const InputDecoration(
                    label: Text('store Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter name of Your store',

                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _textController,
                  validator: (val){
                    if (val!.isEmpty){
                      return 'Enter valid Data';
                    }
                  },
                  decoration: const InputDecoration(
                    label: Text('Store Description'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter Details of Your store',

                  ),
                ),
                const SizedBox(height: 10,),
                const TextField(
                  minLines: 1,
                  maxLines: 50,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Enter your store Location (optional)',
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String inputValue = _textController.text;
                    print('Input value: $inputValue');
                  }
                }, child: const Text('Submit'),),
              ],
            ),
          ),),
      ),
    );
  }
}
