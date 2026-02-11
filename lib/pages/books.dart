
import 'package:book_stash_new/service/database.dart';
import 'package:book_stash_new/utils/toast.dart';
import'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Books extends StatefulWidget{
  Books({super.key});

  @override
  _books createState() => _books();
  
}

class _books extends State<Books>{
  
  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController  price = TextEditingController(); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Add a Book", style: TextStyle(fontSize: 20, color:Color.fromARGB(255, 28, 255, 8)),),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left:20,top:30,right: 20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title ", style: TextStyle(fontSize: 16, color: Colors.blueAccent),),
             TextField(
            controller: title,
            decoration: InputDecoration(
              hintText: "Enter book title here",
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          ),
          SizedBox(height: 20,),
        
          Text("Author ",style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
             TextField(
            controller: author,
            decoration: InputDecoration(
              hintText: "Enter author name here",
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          ),
          SizedBox(height: 20,),
        
          Text("Price ",style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
             TextField(
            controller: price,
            decoration: InputDecoration(
              hintText: "Enter price here",
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          ),
          SizedBox(height: 20,),
          Center(child: OutlinedButton(onPressed: () async{
           
            String id = randomAlphaNumeric(10);
        
            Map<String,dynamic> bookInfoMap = {
                  "Title" : title.text,
                  "Author": author.text,
                  "Price" : price.text,
                  "Id"    : id,
            };
        
            await DatabaseHelper(). addBookdetails(bookInfoMap, id).then((value){
            Message.show(message: "Book has been added");
            Navigator.of(context).pop();
               
              });
        
          }, child: const Text("Add")),)
            ]
        ),
        ),
      ),
      
      
    );
  }

}