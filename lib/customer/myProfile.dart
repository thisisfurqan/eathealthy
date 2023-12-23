import 'package:flutter/material.dart';

class myProfile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/main.jpg'),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _textController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter valid Data';
                    }
                  },
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter your name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _textController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter valid Data';
                    }
                  },
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _textController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter valid Data';
                    }
                  },
                  decoration: const InputDecoration(
                    label: Text('Mobile Number'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter your mobile number',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String inputValue = _textController.text;
                      print('Input value: $inputValue');
                    }
                  },
                  child: const Text('Save'),
                ),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Change Picture'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
