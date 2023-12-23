import 'package:flutter/material.dart';
import 'customerFirebaseHandler.dart';
import 'foodDetails.dart';

class OrderFoodCard extends StatefulWidget {
  const OrderFoodCard({
    super.key,
  });

  @override
  State<OrderFoodCard> createState() => _OrderFoodCardState();
}

class _OrderFoodCardState extends State<OrderFoodCard> {

  @override
  Widget build(BuildContext context) {
    String title = 'I am the title';
    String price = '720';
    String imageUrl = '';
    return Container(
      margin: const EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white60,
      ),
      child: StreamBuilder(
        stream: getFoodData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
// Display a loading indicator while waiting for the data
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
// Display an error message if an error occurs
            return Text('Error: ${snapshot.error}');
          } else {
// Display the data in a ListView
            List<Map<String, dynamic>>? foodData = snapshot.data;
            return ListView.builder(
              itemCount: foodData!.length,
              itemBuilder: (context, index) {
                ///this list will assign the all items from the list "foodData" one by one to the local variables.
                Map<String, dynamic> currentItem = foodData![index];
                title = currentItem['title'] ?? 'Welcome to the Eathealthy';
                price = (currentItem['price'] ?? '0');
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => foodDetails(
                                          title: currentItem['title'] ??
                                              'Welcome to Eathealthy',
                                          price: currentItem['price'] ?? '0',
                                          imageUrl:
                                              currentItem['imageUrl'] ?? '',
                                          description:
                                              currentItem['description'] ??
                                                  'Default Description',
                                      vendorID: currentItem['vendorID'] ??
                                          'Default Vendor ID',
                                        )));
                          },
                          child: const Text('Order'),
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
