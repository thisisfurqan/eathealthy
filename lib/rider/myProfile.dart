import 'package:flutter/material.dart';

class myProfile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'My Profile'
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextFormField(
                  controller: _textController,
                  validator: (val){
                    if (val!.isEmpty){
                      return 'Enter valid Data';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text('store Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter name of Your store',

                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _textController,
                  validator: (val){
                    if (val!.isEmpty){
                      return 'Enter valid Data';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text('store Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter name of Your store',

                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _textController,
                  validator: (val){
                    if (val!.isEmpty){
                      return 'Enter valid Data';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text('store Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter name of Your store',

                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _textController,
                  validator: (val){
                    if (val!.isEmpty){
                      return 'Enter valid Data';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text('store Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter name of Your store',

                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _textController,
                  validator: (val){
                    if (val!.isEmpty){
                      return 'Enter valid Data';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text('store Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter name of Your store',

                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String inputValue = _textController.text;
                    print('Input value: $inputValue');
                  }
                }, child: Text('Submit'),),
              ],
            ),
          ),),
      ),
    );
  }
}
