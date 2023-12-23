import 'package:eathealthy/vendor/vendorFirebaseHandler.dart';
import 'package:flutter/material.dart';

class orderListCard extends StatelessWidget {
  String title = 'I am the title';
  String price = '720';
  String description = 'I am the description';
  String imageUrl = '';
  String orderQuantity = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white60,
      ),
      child: StreamBuilder(
        stream: getOrderData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
// Display a loading indicator while waiting for the data
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
// Display an error message if an error occurs
            return Text('Error: ${snapshot.error}');
          }
    else if (snapshot.data == null) {
    return Text('No data available.');}
          else {
// Display the data in a ListView
            List<Map<String, dynamic>>? orderData = snapshot.data;
            return ListView.builder(
              itemCount: orderData!.length,
              itemBuilder: (context, index) {
                ///this list will assign the all items from the list "foodData" one by one to the local variables.
                Map<String, dynamic> currentItem = orderData![index];
                title = currentItem['title'] ?? 'Welcome to the Eathealthy';
                price = (currentItem['price'] ?? '0');
                description =
                    currentItem['description'] ?? 'Welcome to the Eathealthy';
                imageUrl = currentItem['imageUrl'] ?? 'assets/main.jpg';

                /// this part will display  food data on screen
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 5, top: 20, bottom: 20),
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image(
                            image: NetworkImage('$imageUrl'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        top: 30,
                        child: Container(
                          width: 200,
                          child: Text(
                            '$title',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Divider(
                        indent: 130,
                        endIndent: 10,
                        height: 150,
                        color: Colors.white,
                      ),
                      /********   detail button     *********/
                      Positioned(
                        top: 100,
                        left: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => orderDetails(
                            //           title: currentItem['title'] ??
                            //               'Welcome to Eathealthy',
                            //           price: currentItem['price'] ?? '0',
                            //           imageUrl:
                            //           currentItem['imageUrl'] ?? '',
                            //           description:
                            //           currentItem['description'] ??
                            //               'Default Description',
                            //           vendorID: currentItem['vendorId'] ??
                            //               'Default Vendor ID',
                            //         )));
                          },
                          child: const Text('Accept'),
                        ),
                      ),
                      ///Price
                      Positioned(
                        top: 115,
                        left: 240,
                        child:  Text('Price: $price', style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
