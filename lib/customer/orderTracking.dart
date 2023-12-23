import 'package:flutter/material.dart';

class orderTracking extends StatelessWidget {
  const orderTracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracking'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent,
                ),
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        'I am the Title of your Order bla bla bla bla bla hahahaha',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          //color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 70, left: 10),
                      child: const Text('Status:', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),),
                    Container(
                      margin: const EdgeInsets.only(top: 115, left: 10),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.cookie),
                              Text('Your meal is being prepared by Chef'),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.car_crash),
                              Text('Rider picked up you meal. Will be Delivered soon.'),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.white,),
                              Text('Your meal has been Delivered. Enjoy!!!', style: TextStyle(color: Colors.white,),),
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(
                                height: 90,
                                width: 50,
                              ),
                              ElevatedButton(onPressed: null, child: Text('Give Ratings', style: TextStyle(color: Colors.yellow,),),),
                              SizedBox(width: 10,),
                              ElevatedButton(onPressed: null, child: Text('Feed Back', style: TextStyle(color: Colors.black,),),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent,
                ),
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        'I am the Title of your Order bla bla bla bla bla hahahaha',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          //color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 70, left: 10),
                      child: const Text('Status:', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),),
                    Container(
                      margin: const EdgeInsets.only(top: 115, left: 10),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.cookie),
                              Text('Your meal is being prepared by Chef'),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.car_crash),
                              Text('Rider picked up you meal. Will be Delivered soon.'),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.white,),
                              Text('Your meal has been Delivered. Enjoy!!!', style: TextStyle(color: Colors.white,),),
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(
                                height: 90,
                                width: 50,
                              ),
                              ElevatedButton(onPressed: null, child: Text('Give Ratings', style: TextStyle(color: Colors.yellow,),),),
                              SizedBox(width: 10,),
                              ElevatedButton(onPressed: null, child: Text('Feed Back', style: TextStyle(color: Colors.black,),),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent,
                ),
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        'I am the Title of your Order bla bla bla bla bla hahahaha',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          //color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 70, left: 10),
                      child: const Text('Status:', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),),
                    Container(
                      margin: const EdgeInsets.only(top: 115, left: 10),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.cookie),
                              Text('Your meal is being prepared by Chef'),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.car_crash),
                              Text('Rider picked up you meal. Will be Delivered soon.'),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.white,),
                              Text('Your meal has been Delivered. Enjoy!!!', style: TextStyle(color: Colors.white,),),
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(
                                height: 90,
                                width: 50,
                              ),
                              ElevatedButton(onPressed: null, child: Text('Give Ratings', style: TextStyle(color: Colors.yellow,),),),
                              SizedBox(width: 10,),
                              ElevatedButton(onPressed: null, child: Text('Feed Back', style: TextStyle(color: Colors.black,),),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

