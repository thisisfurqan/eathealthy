import 'package:flutter/material.dart';
import 'orderHistory.dart';
import 'customerFirebaseHandler.dart';

class foodDetails extends StatefulWidget {
  const foodDetails({super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.vendorID,
  });
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  final String vendorID;
  @override
  State<foodDetails> createState() => _foodDetailsState();
}

class _foodDetailsState extends State<foodDetails> {
  TextEditingController newTextEditingController = TextEditingController();
  String amount = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                  child: Image(
                image: NetworkImage(widget.imageUrl),
              )),
              Column(
                children: [
                  const Text(
                    'Food Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    'Food Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    'Food Price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    widget.price,
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: newTextEditingController,
                    maxLength: 2,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter Quantity',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val) {
                      amount = val;
                      int result = 1;
                      result = int.parse(amount) * int.parse(widget.price);
                      setState(() {
                        amount = result.toString();
                      });
                    },
                  ),
                  Text(
                    'Total Amount: $amount',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      await uploadOrderData(widget.title,widget.description, widget.price, widget.imageUrl, widget.vendorID);
                      confirmAlertDialog(
                          context, widget.title,);
                    },
                    child: const Text('Confirm Order'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/// **** Confirmation Dialogue **
void confirmAlertDialog(BuildContext context, String title,) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Text('$title', textScaleFactor: 1.2),
          //description of food + order quantity + total price
          content: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                  size: 50,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: const Text(
                    'Thank You! \nYour Order has been Recieved. View your order details in "Order History"'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child:  const Text('View order History'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const orderHistory(),),);
              },
            ),
            TextButton(
              child: const Text('close'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ),
  );

}