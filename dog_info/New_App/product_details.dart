import"package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatelessWidget{
  String? name;
  String? age;
  String? details;
  String? budget;
  String? address;
  String? contact;
  String? emi;

  ProductDetails({ required this.name, required this.age, required this.details, required this.budget, required this.address, required this.contact,required this.emi});
Future<void> _send() async {
  final String mes = '''
New Order Received

Name: $name
Age: $age
Product: $details
Budget: $budget
Address: $address
Contact: $contact
EMI: $emi
''';

  final String phone = "919360868362";
  final String url =
      "https://wa.me/$phone?text=${Uri.encodeComponent(mes)}";

  await launch(url);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(centerTitle: true, title: Text("Product Details"),foregroundColor: const Color.fromARGB(255, 0, 204, 48),),

   body: Center(
    child: Column(
      children: [
        SizedBox(height: 30,),
        Text("Name:  $name" ),
        SizedBox(height: 20,),
        Text("Age:  $age" ),
        SizedBox(height: 20,),
        Text("Product Details:  $details" ),
        SizedBox(height: 20,),
        Text("Budget:  $budget" ),
        SizedBox(height: 20,),
        Text("Address:  $address" ),
        SizedBox(height: 20,),
        Text("EMI:  $emi" ),
        SizedBox(height: 20,),

        ElevatedButton.icon(
          icon: Icon(Icons.send),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 162, 244, 10),
            padding: EdgeInsets.all(30)
          ),

          onPressed: (){
           _send();
        }, label: Text("Submit Order")),
      ],
    ),
   ),
    );
   
  }}